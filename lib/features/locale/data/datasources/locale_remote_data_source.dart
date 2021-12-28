import 'package:boiler/core/network/network_calls.dart';
import 'package:boiler/core/network/network_info.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/locale/data/models/locale_model.dart';

abstract class LocaleRemoteDataSource {
  Future<LocaleModel> getLocale(String uID);
  Future<void> saveLocale(LocaleModel localeModel);
}

class LocaleRemoteDataSourceImpl implements LocaleRemoteDataSource {
  final NetworkCalls networkCalls;
  final NetworkInfo networkInfo;


  LocaleRemoteDataSourceImpl({required this.networkCalls, required this.networkInfo});

  @override
  Future<LocaleModel> getLocale(String uID) async {
   var response = await  networkCalls.get(url: kLocaleURL + uID);
    return LocaleModel.fromJson(response.data);
  }

  @override
  Future<void> saveLocale(LocaleModel localeModel) {
    return networkCalls.post(url: kLocaleURL, data: localeModel.toJson());
  }
}
