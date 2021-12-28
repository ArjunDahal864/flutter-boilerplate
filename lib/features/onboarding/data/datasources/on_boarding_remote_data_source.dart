import 'package:boiler/core/network/network_calls.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/onboarding/data/models/on_boarding_model.dart';

abstract class OnBoardingRemoteDataSource {
  Future<bool> saveOnBoardingData(OnBoardingModel onBoardingModel);
}

class OnBoardingRemoteDataSourceImpl implements OnBoardingRemoteDataSource {
  final NetworkCalls networkCalls;

  OnBoardingRemoteDataSourceImpl({required this.networkCalls});
  @override
  Future<bool> saveOnBoardingData(OnBoardingModel onBoardingModel) async {
    try {
      await networkCalls.post(
          url: kOnbaordingURL, data: onBoardingModel.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
