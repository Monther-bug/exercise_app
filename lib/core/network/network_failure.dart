sealed class NetworkFailure {
  final String message;
  const NetworkFailure(this.message);
}

class NoConnectionfailure extends NetworkFailure{
  const NoConnectionfailure(): super('no internet connection');
}
//401
class UnauthorizedFailure extends NetworkFailure {
  const UnauthorizedFailure() : super('Session expired. Please log in again.');
}

//500
class ServerFailure extends NetworkFailure {
  const ServerFailure(super.message);
}

//400
class BadRequestFailure extends NetworkFailure {
  const BadRequestFailure() : super('Invalid request. Please check your input.');
}
 

//404
class NotFoundFailure extends NetworkFailure {
  const NotFoundFailure() : super('Requested resource not found.');
}

//422
class ValidationFailure extends NetworkFailure {
  const ValidationFailure() : super('Invalid data provided.');
}

class TimeoutFailure extends NetworkFailure {
  const TimeoutFailure() : super('Connection timed out.');
}