import 'package:equatable/equatable.dart';

class OnBoarding extends Equatable {
  final bool isOnBoardingCompleted;
  final String deviceID;

  const OnBoarding(
      {required this.deviceID, required this.isOnBoardingCompleted});
  @override
  List<Object?> get props => [isOnBoardingCompleted,deviceID];
}
