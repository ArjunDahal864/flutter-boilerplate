import 'package:boiler/core/error/failure.dart';
import 'package:boiler/features/locale/domain/entities/locale.dart';
import 'package:dartz/dartz.dart';

abstract class LocaleRepository {
  Future<Either<Failure, Locale>> getLocale(String userID);
  Future<Either<Failure, Locale>> setLocale(Locale locale);
}
