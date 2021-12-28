import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/theme/domain/entities/application_theme.dart';
import 'package:boiler/features/theme/domain/repositories/application_theme_repository.dart';
import 'package:dartz/dartz.dart';

class GetTheme implements UseCase<ApplicationTheme, NoParams> {
  final ApplicationThemeRepository applicationThemeRepository;

  GetTheme({required this.applicationThemeRepository});
  @override
  Future<Either<Failure, ApplicationTheme>> call(NoParams params) {
    return applicationThemeRepository.getTheme();
  }
}
