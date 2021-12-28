import 'dart:convert';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/theme/data/models/application_theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ApplicationThemeLocalDataSource {
  Future<void> saveApplicationTheme(ApplicationThemeModel applicationTheme);
  Future<ApplicationThemeModel> getApplicationTheme();
}

class ApplicationThemeLocalDataSourceImpl
    implements ApplicationThemeLocalDataSource {
  final SharedPreferences sharedPreferences;

  ApplicationThemeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveApplicationTheme(
      ApplicationThemeModel applicationTheme) async {
    await sharedPreferences.setString(
      kTheme,
      json.encode(applicationTheme.toJson()),
    );
  }

  @override
  Future<ApplicationThemeModel> getApplicationTheme() async {
    var response = sharedPreferences.getString(kTheme) ??
        json.encode(const ApplicationThemeModel(name: kLightTheme).toJson());
    return ApplicationThemeModel.fromJson(jsonDecode(response));
  }
}
