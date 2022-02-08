import 'package:boiler/core/error/failure.dart';
import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository{
  Future<Either<Failure,LoginResponse>> emailAndPasswordLogin(String email, String password);
  Future<Either<Failure,LoginResponse>> googleLogin();
  Future<Either<Failure,bool>> localSignIn();
  Future<Either<Failure,bool>> signOut();
}