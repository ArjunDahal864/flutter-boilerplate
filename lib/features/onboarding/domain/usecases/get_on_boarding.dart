import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/usecase/usecase.dart';
import 'package:boiler/features/onboarding/domain/entities/on_boarding.dart';
import 'package:boiler/features/onboarding/domain/repositories/on_boarding_repository.dart';
import 'package:dartz/dartz.dart';

class GetOnBoarding implements UseCase<OnBoarding, NoParams> {
  final OnBoardingRepository repository;
  const GetOnBoarding({required this.repository});
  @override
  Future<Either<Failure,OnBoarding>> call(NoParams params) {
    return repository.getOnBoardingCompleted();
  }
}