import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/onboarding/domain/entities/on_boarding.dart';
import 'package:boiler/features/onboarding/domain/repositories/on_boarding_repository.dart';
import 'package:dartz/dartz.dart';

class SetOnBoarding implements UseCase<void, bool> {
  final OnBoardingRepository repository;
  const SetOnBoarding({required this.repository});
  @override
  Future<Either<Failure,OnBoarding>> call(bool param) async {
    return await repository.setOnBoardingCompleted(param);
  }
}
