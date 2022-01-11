import 'package:bloc/bloc.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/theme/domain/entities/application_theme.dart';
import 'package:boiler/features/theme/domain/usecases/get_theme.dart';
import 'package:boiler/features/theme/domain/usecases/set_theme.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetTheme getTheme;
  final SetTheme setTheme;

  ThemeBloc({required this.getTheme, required this.setTheme})
      : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) {});
    on<ThemeStatusEvent>((event, emit) async {
      emit(ThemeLoadingState());
      var response = await getTheme.call(NoParams());
      response.fold(
          (Failure failure) => emit(ThemeErrorState()),
          (ApplicationTheme applicationTheme) =>
              emit(ThemeLoadedState(theme: applicationTheme)));
    });
    on<ThemeChangeEvent>((event, emit) async {
      emit(ThemeLoadingState());
      var response = await setTheme.call(ThemeParam(theme: event.theme));
      response.fold(
          (Failure failure) => emit(ThemeErrorState()),
          (ApplicationTheme applicationTheme) =>
              emit(ThemeLoadedState(theme: applicationTheme)));
    });
  }
}
