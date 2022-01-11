import 'dart:convert';

import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/onboarding/data/models/on_boarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> setIsOnBoardingComplete(OnBoardingModel onBoardingModel);
  Future<OnBoardingModel> getIsOnBoardingComplete();
}

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnBoardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> setIsOnBoardingComplete(OnBoardingModel onBoardingModel) async {
    await sharedPreferences.setString(
      kIsOnBoardingComplete,
      jsonEncode(onBoardingModel.toJson()),
    );
  }

  @override
  Future<OnBoardingModel> getIsOnBoardingComplete() async {
    final jsonString = sharedPreferences.getString(kIsOnBoardingComplete) ??
        jsonEncode(
            const OnBoardingModel(isOnBoardingComplete: false, userDeviceID: '')
                .toJson());
    return OnBoardingModel.fromJson(json.decode(jsonString));
  }
}
