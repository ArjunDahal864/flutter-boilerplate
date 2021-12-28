import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String msg;
  const Failure({required this.msg,});
  @override
  List<Object> get props => [msg];
}

// Daaabase Failure
class DatabaseFailure extends Failure {
  final String message;
  const DatabaseFailure(this.message) : super(msg: message);
}

// Authentication Failure
class AuthenticationFailure extends Failure {
  final String message;
  const AuthenticationFailure(this.message) : super(msg: message);
}

// Authorization Failure
class AuthorizationFailure extends Failure {
  final String message;
  const AuthorizationFailure(this.message) : super(msg: message);
}

// Bad Request Failure
class BadRequestFailure extends Failure {
  final String message;
  const BadRequestFailure(this.message) : super(msg: message);
}

// Not Found Failure
class NotFoundFailure extends Failure {
  final String message;
  const NotFoundFailure(this.message) : super(msg: message);
}

// Network Failure
class NetworkFailure extends Failure {
  final String message;
  const NetworkFailure(this.message) : super(msg: message);
}

// Internal Server Failure
class InternalServerFailure extends Failure {
  final String message;
  const InternalServerFailure(this.message) : super(msg: message);
}

// Forbidden Failure
class ForbiddenFailure extends Failure {
  final String message;
  const ForbiddenFailure(this.message) : super(msg: message);
}

// Unkown Failure
class UnknownFailure extends Failure {
  final String message;
  const UnknownFailure(this.message) : super(msg: message);
}
// Device Not Supported Failure
class DeviceNotSupportedFailure extends Failure {
  final String message;
  const DeviceNotSupportedFailure(this.message) : super(msg: message);
}