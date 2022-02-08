import 'package:bloc/bloc.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:boiler/features/login/domain/usecases/google_login.dart';
import 'package:boiler/features/login/domain/usecases/local_login.dart';
import 'package:boiler/features/login/domain/usecases/login.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final LocalLogin localLogin;
  final GoogleLogin googleLogin;

  LoginBloc({
    required this.login,
    required this.localLogin,
    required this.googleLogin,
  }) : super(LoginInitialState()) {
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      var res = await login(LoginParams(
        email: event.email,
        password: event.password,
      ));
      res.fold(
        (Failure failure) => emit(LoginFailureState(error: failure.msg)),
        (LoginResponse loginResponse) =>
            emit(LoginSuccessState(response: loginResponse)),
      );
    });

    on<LocalLoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      var res = await localLogin(NoParams());
      res.fold(
        (Failure failure) => emit(LoginFailureState(error: failure.msg)),
        (void loginResponse) =>
            emit(const LocalLoginSuccessState(message: "Logged in")),
      );
    });

    on<GoogleLoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      var res = await googleLogin(NoParams());
      res.fold(
        (Failure failure) => emit(LoginFailureState(error: failure.msg)),
        (LoginResponse loginResponse) =>
            emit(LoginSuccessState(response: loginResponse)),
      );
    });

  }
}

