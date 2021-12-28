import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/theme/domain/entities/application_theme.dart';
import 'package:boiler/features/theme/domain/repositories/application_theme_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SetTheme implements UseCase<ApplicationTheme, ThemeParam> {
  final ApplicationThemeRepository applicationThemeRepository;
  const SetTheme({required this.applicationThemeRepository});
  @override
  Future<Either<Failure, ApplicationTheme>> call(ThemeParam params) {
    return applicationThemeRepository.setTheme(params.theme);
  }
}

class ThemeParam extends Equatable {
  final String theme;
  const ThemeParam({required this.theme});
  @override
  List<Object?> get props => [theme];
}
