import 'package:equatable/equatable.dart';

abstract class LoginResponse extends Equatable {
  final String emailAddress;
  final String userDisplayName;
  final String userPhotoUrl;
  final String userID;
  final String userIdToken;
  final String userAccessToken;
  const LoginResponse(
      {required this.emailAddress,
      required this.userDisplayName,
      required this.userPhotoUrl,
      required this.userID,
      required this.userIdToken,
      required this.userAccessToken});

  @override
  List<Object?> get props => [
        emailAddress,
        userDisplayName,
        userPhotoUrl,
        userID,
        userIdToken,
        userAccessToken,
      ];
}
