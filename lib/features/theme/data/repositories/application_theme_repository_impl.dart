import 'package:boiler/core/device/device_info.dart';
import 'package:boiler/core/error/exceptions.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/network/network_info.dart';
import 'package:boiler/features/theme/data/datasources/application_theme_local_data_source.dart';
import 'package:boiler/features/theme/data/datasources/application_theme_remote_datasource.dart';
import 'package:boiler/features/theme/data/models/application_theme_model.dart';
import 'package:boiler/features/theme/domain/repositories/application_theme_repository.dart';
import 'package:dartz/dartz.dart';

class ApplicationThemeRepositoryImpl implements ApplicationThemeRepository {
  final ApplicationThemeLocalDataSource localDataSource;
  final ApplicationThemeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final DeviceInfo deviceInfo;

  ApplicationThemeRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
    required this.deviceInfo,
  });

  @override
  Future<Either<Failure, ApplicationThemeModel>> getTheme() async {
    try {
      var response = await localDataSource.getApplicationTheme();
      return Right(response);
    } on UnknownException catch (e) {
      return Left(UnknownFailure(e.toString()));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApplicationThemeModel>> setTheme(String theme) async {
    ApplicationThemeModel _applicationThemeModel =
        ApplicationThemeModel(name: theme);
    if (await networkInfo.isConnected()) {
      try {
        // await remoteDataSource.setTheme(_applicationThemeModel);
        await localDataSource.saveApplicationTheme(_applicationThemeModel);
        return Right(_applicationThemeModel);
      } on InternalServerException {
        return const Left(InternalServerFailure("something went wrong"));
      } on UnknownException {
        return const Left(UnknownFailure("something went wrong"));
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      try {
        await localDataSource.saveApplicationTheme(_applicationThemeModel);
        return Right(_applicationThemeModel);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    }
  }
}
