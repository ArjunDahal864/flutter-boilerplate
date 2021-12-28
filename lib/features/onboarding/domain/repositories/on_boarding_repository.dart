import 'package:boiler/core/error/failure.dart';
import 'package:boiler/features/onboarding/domain/entities/on_boarding.dart';
import 'package:dartz/dartz.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure,OnBoarding>> setOnBoardingCompleted(bool onBoarding);
  Future<Either<Failure,OnBoarding>> getOnBoardingCompleted();
}