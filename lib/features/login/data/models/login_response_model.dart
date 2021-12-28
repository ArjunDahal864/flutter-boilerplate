import 'package:boiler/features/login/domain/entities/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends LoginResponse {
  @JsonKey(name: 'access_token')
  final String acToken;
  @JsonKey(name: 'refresh_token')
  final String reToken;
  @JsonKey(name: 'user_id')
  final String userID;
  @JsonKey(name: 'role')
  final String userRole;
  @JsonKey(name: 'expires_in')
  final int expiresAt;

  const LoginResponseModel({
    required this.reToken,
    required this.acToken,
    required this.userID,
    required this.userRole,
    required this.expiresAt,
  
  }) : super(
          token: acToken,
          refreshToken: reToken,
          userId: userID,
          role: userRole,
          expiresIn: expiresAt,
        );
      

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
