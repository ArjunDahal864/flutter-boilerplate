import 'package:boiler/core/error/exceptions.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/network/network_info.dart';
import 'package:boiler/features/locale/data/datasources/locale_local_data_source.dart';
import 'package:boiler/features/locale/data/datasources/locale_remote_data_source.dart';
import 'package:boiler/features/locale/data/models/locale_model.dart';
import 'package:boiler/features/locale/domain/entities/locale.dart';
import 'package:boiler/features/locale/domain/repositories/locale_repository.dart';
import 'package:dartz/dartz.dart';

class LocaleRepositoryImpl extends LocaleRepository {
  final LocaleLocalDataSource localDataSource;
  final LocaleRemoteDataSource localeRemoteDataSource;
  final NetworkInfo networkInfo;

  LocaleRepositoryImpl(
      {required this.localDataSource,
      required this.localeRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Locale>> getLocale(String userID) async {
    if (await networkInfo.isConnected()) {
      try {
        // final locale = await localeRemoteDataSource.getLocale(uID);
        // localDataSource.setLocale(locale);
        var locale = await localDataSource.getLocale();
        return Right(locale);
      } on InternalServerException catch (e) {
        return Left(InternalServerFailure(e.toString()));
      } on AuthorizationException catch (e) {
        return Left(AuthorizationFailure(e.toString()));
      } on BadRequestException catch (e) {
        return Left(BadRequestFailure(e.toString()));
      } on NotFoundException catch (e) {
        return Left(NotFoundFailure(e.toString()));
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      try {
        final locale = await localDataSource.getLocale();
        return Right(locale);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Locale>> setLocale(Locale locale) async {
    var localModel = LocaleModel(lC: locale.languageCode,cC: locale.countryCode,uID: locale.userID);

    if (await networkInfo.isConnected()) {
      try {
        // await localeRemoteDataSource.saveLocale(localModel);
        var response = await localDataSource.setLocale(localModel);
        return Right(response);
      } on InternalServerException catch (e) {
        return Left(InternalServerFailure(e.toString()));
      } on AuthorizationException catch (e) {
        return Left(AuthorizationFailure(e.toString()));
      } on BadRequestException catch (e) {
        return Left(BadRequestFailure(e.toString()));
      } on NotFoundException catch (e) {
        return Left(NotFoundFailure(e.toString()));
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    }else{
      try {
        final localeModel = await localDataSource.setLocale(localModel);
        return Right(localeModel);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    }
  }
}
