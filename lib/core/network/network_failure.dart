import 'package:exercise_app/core/utils/l10n_extension.dart';

sealed class NetworkFailure {
  final String message;
  const NetworkFailure(this.message);
}

class NoConnectionfailure extends NetworkFailure{
  const NoConnectionfailure(): super(AppMessageKey.noInternetConnection);
}
//401
class UnauthorizedFailure extends NetworkFailure {
  const UnauthorizedFailure() : super(AppMessageKey.sessionExpired);
}

//500
class ServerFailure extends NetworkFailure {
  const ServerFailure(super.message);
}

//400
class BadRequestFailure extends NetworkFailure {
  const BadRequestFailure() : super(AppMessageKey.invalidRequest);
}
 

//404
class NotFoundFailure extends NetworkFailure {
  const NotFoundFailure() : super(AppMessageKey.resourceNotFound);
}

//422
class ValidationFailure extends NetworkFailure {
  const ValidationFailure() : super(AppMessageKey.invalidDataProvided);
}

class TimeoutFailure extends NetworkFailure {
  const TimeoutFailure() : super(AppMessageKey.connectionTimedOut);
}
