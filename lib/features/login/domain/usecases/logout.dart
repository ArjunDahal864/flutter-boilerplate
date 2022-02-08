import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class Logout extends UseCase<bool,NoParams>{
  final LoginRepository loginRepository;
  Logout({required this.loginRepository});
  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return loginRepository.signOut();
  }
}