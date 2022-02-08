import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends LoginResponse {
  final String email;
  final String displayName;
  final String photoUrl;
  final String uid;
  final String idToken;
  final String accessToken;
 const LoginResponseModel({required this.email, required this.displayName, required this.photoUrl,required this.uid, required this.idToken, required this.accessToken}):super(
   userDisplayName: displayName,
    emailAddress: email,
    userPhotoUrl: photoUrl,
    userID: uid,
    userIdToken: idToken,
    userAccessToken: accessToken,
 );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
