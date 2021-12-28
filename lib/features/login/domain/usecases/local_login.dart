import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LocalLogin implements UseCase<void,NoParams>{
  final LoginRepository repository;
  const LocalLogin({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params)async {
    return await repository.localSignIn();
  }
  
}