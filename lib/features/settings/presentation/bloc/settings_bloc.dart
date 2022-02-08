import 'package:bloc/bloc.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/login/domain/usecases/logout.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final Logout logout;

  SettingsBloc({required this.logout}) : super(OnSettingsInitialState()) {
    on<LogoutEvent>(
      (event, emit) async {
        var response = await logout(NoParams());
        response.fold((l) => emit(OnSettingsErrorState(errorMessage: l.msg)),
            (r) => emit(OnLogoutCompleteState()));
      },
    );
  }
}
