class AppException implements Exception{
  final message;
  final prefix;
  AppException([this.message,this.prefix]);

  String toString(){
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, "Invalid Request: ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, "Unauthorized: ");
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message])
      : super(message, "Forbidden: ");
}

class NotFoundException extends AppException {
  NotFoundException([String? message])
      : super(message, "Not Found: ");
}

class ConflictException extends AppException {
  ConflictException([String? message])
      : super(message, "Conflict: ");
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message])
      : super(message, "Internal Server Error: ");
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, "No Internet Connection: ");
}

class TimeoutException extends AppException {
  TimeoutException([String? message])
      : super(message, "Request Timeout: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, "Invalid Input: ");
}
