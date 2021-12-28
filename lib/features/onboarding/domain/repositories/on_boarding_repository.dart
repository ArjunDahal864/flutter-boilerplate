import 'package:boiler/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class OnBoardingRepository {
  Future<Either<Failure,bool>> setOnBoardingCompleted(bool completed);
  Future<Either<Failure,bool>> getOnBoardingCompleted();
}