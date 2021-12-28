part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final dynamic properties;
  const LoginState({this.properties});
  @override
  List<Object> get props => [properties];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;
  const LoginFailureState({required this.error}):super(properties: error);
}

class LoginSuccessState extends LoginState {
  final LoginResponse response;
  const LoginSuccessState({required this.response}) : super(properties: response);
}

class DeleteSuccessState extends LoginState {
  final String message;
  const DeleteSuccessState({required this.message}):super(properties: message);
}

class LocalLoginSuccessState extends LoginState {
  final String message;
  const LocalLoginSuccessState({required this.message}) : super(properties: message);
}
