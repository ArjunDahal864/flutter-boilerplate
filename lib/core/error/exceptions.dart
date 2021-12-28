
class BaseException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  BaseException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

// Database Exception
class DatabaseException extends BaseException {
  DatabaseException([String? message]) : super(message, "Database Error: ");
}


// Authentication Exception
class AuthenticationException extends BaseException {
  AuthenticationException([String? message]) : super(message, "Authentication Error: ");
}

// Authorization Exception
class AuthorizationException extends BaseException {
  AuthorizationException([String? message]) : super(message, "Authorization Error: ");
}

// Bad Request Exception
class BadRequestException extends BaseException {
  BadRequestException([String? message]) : super(message, "Bad Request Error: ");
}

// Not Found Exception
class NotFoundException extends BaseException {
  NotFoundException([String? message]) : super(message, "Not Found Error: ");
}

// Network Exception
class NetworkException extends BaseException {
  NetworkException([String? message]) : super(message, "Network Error: ");
}

// Internal Server Exception
class InternalServerException extends BaseException {
  InternalServerException([String? message]) : super(message, "Internal Server Error: ");
}

// Forbidden Exception
class ForbiddenException extends BaseException {
  ForbiddenException([String? message]) : super(message, "Forbidden Error: ");
}

// Unknown Exception
class UnknownException extends BaseException {
  UnknownException([String? message]) : super(message, "Unknown Error: ");
}
// Device Not Supported Exception
class DeviceNotSupportedException extends BaseException {
  DeviceNotSupportedException([String? message]) : super(message, "Device Not Supported: ");
}
