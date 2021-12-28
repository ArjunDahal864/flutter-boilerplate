import 'package:equatable/equatable.dart';

abstract class LoginResponse extends Equatable {
  final String token;
  final String userId;
  final String refreshToken;
  final int expiresIn;
  final String role;
  
  const LoginResponse(
      {required this.token,
      required this.userId,
      required this.refreshToken,
      required this.role,
      required this.expiresIn});

  @override
  List<Object?> get props => [token, userId, refreshToken, expiresIn, role];
}
