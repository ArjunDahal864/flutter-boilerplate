import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:boiler/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class GoogleLogin extends UseCase<LoginResponse,NoParams>{
  final LoginRepository loginRepository;

  GoogleLogin({required this.loginRepository});
  @override
  Future<Either<Failure, LoginResponse>> call(NoParams params) {
    return loginRepository.googleLogin();
  }
}