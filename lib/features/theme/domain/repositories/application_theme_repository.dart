import 'package:boiler/core/error/failure.dart';
import 'package:boiler/features/theme/domain/entities/application_theme.dart';
import 'package:dartz/dartz.dart';

abstract class ApplicationThemeRepository {
  Future<Either<Failure, ApplicationTheme>> setTheme(String theme);
  Future<Either<Failure, ApplicationTheme>> getTheme();
}
