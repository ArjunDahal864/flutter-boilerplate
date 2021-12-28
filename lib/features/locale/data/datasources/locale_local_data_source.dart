import 'dart:convert';

import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/locale/data/models/locale_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleLocalDataSource{
  Future<LocaleModel> getLocale();
  Future<LocaleModel> setLocale(LocaleModel locale);
}

class LocalLocaleDataSourceImpl implements LocaleLocalDataSource{
  final SharedPreferences sharedPreferences;

  LocalLocaleDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LocaleModel> getLocale() async {
    final String json = sharedPreferences.getString(kLocale) ?? jsonEncode(const LocaleModel(lC: "en",cC: "US",uID: "userID").toJson());
    return LocaleModel.fromJson(jsonDecode(json));
  }


  @override
  Future<LocaleModel> setLocale(LocaleModel locale) async {
    await  sharedPreferences.setString(kLocale, jsonEncode(locale.toJson()));
    return locale;
  }
  
}