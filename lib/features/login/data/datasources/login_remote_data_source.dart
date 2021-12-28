import 'package:boiler/core/network/network_calls.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/login/data/models/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> emailAndPasswordLogin(
    String email,
    String password,
  );
  // Future<LoginResponseModel> facebookLogin();
  // Future<LoginResponseModel> googleLogin();
  // Future<LoginResponseModel> appleLogin();
  // Future<LoginResponseModel> twitterLogin();
  // Future<LoginResponseModel> githubLogin();
  // Future<LoginResponseModel> microsoftLogin();
  // Future<LoginResponseModel> yahooLogin();
  // Future<LoginResponseModel> linkedinLogin();
  // Future<LoginResponseModel> instagramLogin();
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final NetworkCalls networkCalls;

  LoginRemoteDataSourceImpl({required this.networkCalls});

  @override
  Future<LoginResponseModel> emailAndPasswordLogin(
      String email, String password) async {
    var response = await networkCalls.post(url:kLoginURL, data:{
      'email': email,
      'password': password,
    });
    return LoginResponseModel.fromJson(response.data);
  }
}
