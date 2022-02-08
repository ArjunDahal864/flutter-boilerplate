import 'package:boiler/core/error/exceptions.dart';
import 'package:boiler/core/network/network_info.dart';
import 'package:boiler/features/login/data/datasources/login_local_data_source.dart';
import 'package:boiler/features/login/data/datasources/login_remote_data_source.dart';
import 'package:boiler/features/login/data/models/login_response_model.dart';
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
      return const Left( NetworkFailure("No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, bool>> localSignIn() async {
    var availableBioMetrics =
        await localAuthentication.getAvailableBiometrics();
    if (availableBioMetrics.isEmpty) {
      return const Left(AuthenticationFailure("No Biometrics Available"));
    }
    var isDeviceSupported = await localAuthentication.isDeviceSupported();
    if (!isDeviceSupported) {
      return const Left(DeviceNotSupportedFailure("Device not supported"));
    }
    try {
      var response = await localAuthentication.authenticate(
          localizedReason: "Authenticate to continue");
      if (response) {
        return const Right(true);
      } else {
        return const Left(AuthenticationFailure("Authentication Failed"));
      }
    } on PlatformException catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> googleLogin()async {
    try{
      var response = await remoteLoginDataSource.googleLogin();
      localLoginDataSource.saveLoginResponse(response);
      return Right(response);
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.toString()));
    } on InternalServerException catch (e) {
      return Left(InternalServerFailure(e.toString()));
    }catch(e){
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await remoteLoginDataSource.signOut();
      await localLoginDataSource.signOut();
      return const Right(true);
    } on PlatformException catch (e) {
      return Left(UnknownFailure(e.toString()));
    } on Exception catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
}
