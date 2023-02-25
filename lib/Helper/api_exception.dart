import 'dart:io';

import '../Util/constant.dart';

class CustomException implements Exception {
  String? message;
  String? prefix;
  int? responseCode;

  CustomException([this.message, this.prefix, this.responseCode]);

  @override
  String toString() => !isEmpty(message) ? message! : "Something went wrong";
  String toDetailedString() => '$prefix: $message: $responseCode';
}

class UnauthorizedException extends CustomException {
  UnauthorizedException([message, responseCode])
      : super(message,"Unauthorized User", responseCode);
}

class NotFoundException extends CustomException {
  NotFoundException([message, responseCode])
      : super(message, "Not Found", responseCode);
}

class BadRequestException extends CustomException {
  BadRequestException([message, responseCode])
      : super(message,"Bad Request", responseCode);
}

class InvalidDetailsException extends CustomException {
  InvalidDetailsException([message, responseCode])
      : super(message, "Invalid On-boarding details", responseCode);
}

class BadFormatException extends CustomException {
  BadFormatException({message, responseCode})
      : super(message ?? "There's been an issue but we're working on fixing it",
      "Format Exception", responseCode);
}

class NoInternetException extends CustomException {
  NoInternetException({responseCode})
      : super("No Internet connection", "No Internet connection", responseCode);
}

class GeneralException extends CustomException {
  GeneralException(String message) : super(message);
}

class HandleException {
  String getMessage(ex) {
    if (ex is SocketException) {
      return "Connectivity error";
    } else {
      return ex.toString();
    }
  }
}
