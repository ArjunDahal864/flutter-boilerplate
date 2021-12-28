
import 'package:boiler/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> setIsOnBoardingComplete(bool isOnBoardingComplete);
  Future<bool> getIsOnBoardingComplete();
}

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnBoardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> setIsOnBoardingComplete(bool isOnBoardingComplete) async {
    await sharedPreferences.setBool(
      kIsOnBoardingComplete,
      isOnBoardingComplete,
    );
  }

  @override
  Future<bool> getIsOnBoardingComplete() async {
    return sharedPreferences.getBool(kIsOnBoardingComplete) ?? false;
  }
}