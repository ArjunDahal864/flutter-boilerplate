import 'package:boiler/features/onboarding/domain/entities/on_boarding.dart';
import 'package:json_annotation/json_annotation.dart';
part 'on_boarding_model.g.dart';

@JsonSerializable()
class OnBoardingModel extends OnBoarding {
  @JsonKey(name: "is_onboarded")
  final bool isOnBoardingComplete;
  @JsonKey(name: "device_id")
  final String userDeviceID;

  const OnBoardingModel({required this.isOnBoardingComplete, required this.userDeviceID}):super(isOnBoardingCompleted: isOnBoardingComplete, deviceID: userDeviceID);
  factory OnBoardingModel.fromJson(Map<String, dynamic> json) => _$OnBoardingModelFromJson(json);
  Map<String, dynamic> toJson() => _$OnBoardingModelToJson(this);
}
