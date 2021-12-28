// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      reToken: json['refresh_token'] as String,
      acToken: json['access_token'] as String,
      userID: json['user_id'] as String,
      userRole: json['role'] as String,
      expiresAt: json['expires_in'] as int,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'access_token': instance.acToken,
      'refresh_token': instance.reToken,
      'user_id': instance.userID,
      'role': instance.userRole,
      'expires_in': instance.expiresAt,
    };
