import 'package:bloc/bloc.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:boiler/features/login/domain/usecases/delete_saved_login.dart';
import 'package:boiler/features/login/domain/usecases/get_saved_login.dart';
import 'package:boiler/features/login/domain/usecases/local_login.dart';
import 'package:boiler/features/login/domain/usecases/login.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final GetSavedLogin getSavedLogin;
  final DeleteSavedLogin deleteSavedLogin;
  final LocalLogin localLogin;
  LoginBloc(
      {required this.login,
      required this.deleteSavedLogin,
      required this.localLogin,
      required this.getSavedLogin})
      : super(LoginInitialState()) {

    on<LoginButtonPressedEvent>((event, emit) async{
      emit(LoginLoadingState());
      var res = await login(LoginParams(
        email: event.email,
        password: event.password,
      ));
      res.fold(
        (Failure failure) => emit(LoginFailureState(error: failure.msg)),
        (LoginResponse loginResponse) => emit(LoginSuccessState(response:loginResponse)),
      );
    });

    on<GetSavedLoginEvent>((event, emit) async{
      emit(LoginLoadingState());
      var res = await getSavedLogin(NoParams());
      res.fold(
        (Failure failure) => emit(LoginFailureState(error: failure.msg)),
        (LoginResponse loginResponse) => emit(LoginSuccessState(response:loginResponse)),
      );
    });

    on<DeleteSavedLoginEvent>((event, emit) async{
      emit(LoginLoadingState());
      var res = await deleteSavedLogin(NoParams());
      res.fold(
        (Failure failure) => emit(LoginFailureState(error: failure.msg)),
        (void loginResponse) => emit(const DeleteSuccessState(message: "Deleted")),
      );
    });
    
    on<LocalLoginButtonPressedEvent>((event, emit) async{
      emit(LoginLoadingState());
      var res = await localLogin(NoParams());
      res.fold(
        (Failure failure) => emit(LoginFailureState(error: failure.msg)),
        (void loginResponse) => emit(const LocalLoginSuccessState(message: "Logged in")),
      );
    });

  }
}
