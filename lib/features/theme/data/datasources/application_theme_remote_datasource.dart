import 'package:boiler/core/network/network_calls.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/theme/data/models/application_theme_model.dart';

abstract class ApplicationThemeRemoteDataSource {
  Future<void> setTheme(ApplicationThemeModel applicationTheme);
  Future<ApplicationThemeModel> getTheme(String deviceID);
}

class ApplicationThemeRemoteDataSourceImpl
    extends ApplicationThemeRemoteDataSource {
  final NetworkCalls networkCalls;
  
  ApplicationThemeRemoteDataSourceImpl({required this.networkCalls});

  @override
  Future<void> setTheme(ApplicationThemeModel applicationTheme) async {
    networkCalls.post(url: kThemeURL, data: applicationTheme.toJson());
  }

  @override
  Future<ApplicationThemeModel> getTheme(String deviceID) async {
    var response = await networkCalls.get(
      url: kThemeURL + deviceID,
    );
    return ApplicationThemeModel.fromJson(response.data);
  }
}
