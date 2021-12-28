import 'package:boiler/core/network/network_calls.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/onboarding/data/models/on_boarding_model.dart';

abstract class OnBoardingRemoteDataSource {
  Future<void> saveOnBoardingData(OnBoardingModel onBoardingModel);
}

class OnBoardingRemoteDataSourceImpl implements OnBoardingRemoteDataSource {
  final NetworkCalls networkCalls;

  OnBoardingRemoteDataSourceImpl({required this.networkCalls});
  @override
  Future<void> saveOnBoardingData(OnBoardingModel onBoardingModel) async {
    await networkCalls.post(
        url: kOnbaordingURL, data: onBoardingModel.toJson());
  }
}
