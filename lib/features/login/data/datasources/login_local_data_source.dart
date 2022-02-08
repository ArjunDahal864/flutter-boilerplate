import 'dart:convert';

import 'package:boiler/core/error/exceptions.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/login/data/models/login_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LoginLocalDataSource {
  Future<LoginResponseModel> getLoginResponse();
  Future<void> saveLoginResponse(LoginResponseModel loginResponse);
  Future<void> deleteLoginResponse();
  Future<bool> signOut();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final FlutterSecureStorage secureStorage;

  LoginLocalDataSourceImpl({required this.secureStorage});

  @override
  Future<void> deleteLoginResponse() {
    return secureStorage.delete(key: kSecrectKey);
  }

  @override
  Future<LoginResponseModel> getLoginResponse() async {
    final loginResponseJson = await secureStorage.read(key: kSecrectKey);
    if (loginResponseJson == null) {
      throw AuthenticationException("No login response found");
    }
    return LoginResponseModel.fromJson(json.decode(loginResponseJson));
  }

  @override
  Future<void> saveLoginResponse(LoginResponseModel loginResponse) async {
   return secureStorage.write(
        key: kSecrectKey, value: json.encode(loginResponse.toJson()));
  }

  @override
 Future<bool> signOut()async {
   await secureStorage.delete(key: kSecrectKey);
   return true;
  }

}
