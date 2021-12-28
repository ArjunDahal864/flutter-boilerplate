import 'package:boiler/core/error/failure.dart';
import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository{
  Future<Either<Failure,LoginResponse>> emailAndPasswordLogin(String email, String password);
  // Future<Either<Failure,LoginResponse>> googleLogin();
  // Future<Either<Failure,LoginResponse>> facebookLogin();
  // Future<Either<Failure,LoginResponse>> appleLogin();
  // Future<Either<Failure,LoginResponse>> twitterLogin();
  // Future<Either<Failure,LoginResponse>> githubLogin();
  // Future<Either<Failure,LoginResponse>> microsoftLogin();
  // Future<Either<Failure,LoginResponse>> yahooLogin();
  // localSign in means sign in same device (fringerprint,faceid,etc)
  Future<Either<Failure,bool>> localSignIn();
  //  get saved login response from local storage
  Future<Either<Failure,LoginResponse>> getSavedLoginResponse();
  // delete saved login response from local storage
  Future<Either<Failure,void>> deleteSavedLoginResponse();
  
}