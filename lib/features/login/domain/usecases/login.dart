import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:boiler/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Login implements UseCase<LoginResponse, LoginParams> {
  final LoginRepository repository;

  const Login({required this.repository});

  @override
  Future<Either<Failure, LoginResponse>> call(LoginParams params)async {
    return await repository.emailAndPasswordLogin(params.email, params.password);
  }
  
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
  
}