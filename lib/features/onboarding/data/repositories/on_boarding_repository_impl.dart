import 'package:boiler/core/device/device_info.dart';
import 'package:boiler/core/error/failure.dart';
import 'package:boiler/core/network/network_info.dart';
import 'package:boiler/features/onboarding/data/datasources/on_boarding_local_data_sources.dart';
import 'package:boiler/features/onboarding/data/datasources/on_boarding_remote_data_source.dart';
import 'package:boiler/features/onboarding/data/models/on_boarding_model.dart';
import 'package:boiler/features/onboarding/domain/entities/on_boarding.dart';
import 'package:boiler/features/onboarding/domain/repositories/on_boarding_repository.dart';
import 'package:dartz/dartz.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  final OnBoardingLocalDataSource localDataSource;
  final OnBoardingRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final DeviceInfo deviceInfo;

  OnBoardingRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
    required this.deviceInfo,
  });

  @override
  Future<Either<Failure, OnBoarding>> getOnBoardingCompleted() async {
    try {
      var response = await localDataSource.getIsOnBoardingComplete();
      return Right(response);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OnBoarding>> setOnBoardingCompleted(
      bool onBoarding) async {
    if (await networkInfo.isConnected()) {
      try {
        OnBoardingModel onBoardingModel = OnBoardingModel(
          isOnBoardingComplete: true,
          userDeviceID: await deviceInfo.getDeviceID(),
        );
        // await remoteDataSource.saveOnBoardingData(onBoardingModel);
        await localDataSource.setIsOnBoardingComplete(onBoardingModel);

        return Right(OnBoarding(
          isOnBoardingCompleted: onBoarding,
          deviceID: await deviceInfo.getDeviceID(),
        ));
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    } else {
      try {
        OnBoardingModel onBoardingModel = OnBoardingModel(
          isOnBoardingComplete: true,
          userDeviceID: await deviceInfo.getDeviceID(),
        );
        
        await localDataSource.setIsOnBoardingComplete(onBoardingModel);
        return Right(onBoardingModel);
      } catch (e) {
        return Left(UnknownFailure(e.toString()));
      }
    }
  }
}
