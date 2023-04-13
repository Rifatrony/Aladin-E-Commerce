class AppException implements Exception{
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);

}

class BadRequestException extends AppException{
  BadRequestException([String? message, String? url]) : super(message, "Bad Request", url);
}

class FetchDataException extends AppException{
  FetchDataException([String? message, String? url]) : super(message, "Unable to process", url);
}

class APiNotRespondingException extends AppException{
  APiNotRespondingException([String? message, String? url]) : super(message, "Api Not responding", url);
}

class UnAuthorizedException extends AppException{
  UnAuthorizedException([String? message, String? url]) : super(message, "Un-Authorized Exception", url);
}