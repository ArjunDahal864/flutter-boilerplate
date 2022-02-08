import 'package:boiler/core/network/network_calls.dart';
import 'package:boiler/core/utils/constants.dart';
import 'package:boiler/features/login/data/models/login_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> emailAndPasswordLogin(
    String email,
    String password,
  );
  Future<LoginResponseModel> googleLogin();
  Future<bool> signOut();
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

  @override
  Future<LoginResponseModel> googleLogin()async {
    final GoogleSignInAccount? account = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? auth = await account?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: auth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    return LoginResponseModel(
      email: account!.email.toString(),
      displayName: account.displayName.toString(),
      photoUrl: account.photoUrl.toString(),
      uid: account.id.toString(),
      accessToken: auth!.accessToken.toString(),
      idToken: auth.idToken.toString(),
    );
  }

  @override
  Future<bool> signOut()async {
    await FirebaseAuth.instance.signOut();
    return true;
  }

}
