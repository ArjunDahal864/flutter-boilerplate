// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'on_boarding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardingModel _$OnBoardingModelFromJson(Map<String, dynamic> json) =>
    OnBoardingModel(
      isOnBoardingComplete: json['is_onboarded'] as bool,
      userDeviceID: json['device_id'] as String,
    );

Map<String, dynamic> _$OnBoardingModelToJson(OnBoardingModel instance) =>
    <String, dynamic>{
      'is_onboarded': instance.isOnBoardingComplete,
      'device_id': instance.userDeviceID,
    };
