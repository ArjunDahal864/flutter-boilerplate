import 'package:boiler/core/error/exceptions.dart';
import 'package:boiler/core/network/network_info.dart';
import 'package:boiler/features/login/data/datasources/login_local_data_source.dart';
import 'package:boiler/features/login/data/datasources/login_remote_data_source.dart';
import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDataSource localLoginDataSource;
  final LoginRemoteDataSource remoteLoginDataSource;
  final NetworkInfo networkInfo;
  final LocalAuthentication localAuthentication;

  LoginRepositoryImpl(
      {required this.localLoginDataSource,
      required this.remoteLoginDataSource,
      required this.localAuthentication,
      required this.networkInfo});

  @override
  Future<Either<Failure, LoginResponse>> getSavedLoginResponse() async {
    try {
      var response = await localLoginDataSource.getLoginResponse();
      return Right(response);
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure(e.toString()));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> emailAndPasswordLogin(
      String email, String password) async {
    if (await networkInfo.isConnected()) {
      try {
        var response =
            await remoteLoginDataSource.emailAndPasswordLogin(email, password);
        localLoginDataSource.saveLoginResponse(response);
        return Right(response);
      } on BadRequestException catch (e) {
        return Left(BadRequestFailure(e.toString()));
      } on InternalServerException catch (e) {
        return Left(InternalServerFailure(e.toString()));
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      return Left( NetworkFailure("No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, bool>> localSignIn() async {
    var availableBioMetrics =
        await localAuthentication.getAvailableBiometrics();
    if (availableBioMetrics.isEmpty) {
      return Left(AuthenticationFailure("No Biometrics Available"));
    }
    var isDeviceSupported = await localAuthentication.isDeviceSupported();
    if (!isDeviceSupported) {
      return Left(DeviceNotSupportedFailure("Device not supported"));
    }
    try {
      var response = await localAuthentication.authenticate(
          localizedReason: "Authenticate to continue");
      if (response) {
        return const Right(true);
      } else {
        return Left(AuthenticationFailure("Authentication Failed"));
      }
    } on PlatformException catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSavedLoginResponse()async {
    try{
    var res = await localLoginDataSource.deleteLoginResponse();
    return Right(res);
    }on PlatformException catch (e){
      return Left(DatabaseFailure(e.toString()));
    }catch (e){
      return Left(UnknownFailure(e.toString()));
    }
  }

}
