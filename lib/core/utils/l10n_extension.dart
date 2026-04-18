import 'package:exercise_app/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

abstract final class AppMessageKey {
  static const String loginFailed = 'loginFailed';
  static const String signUpFailed = 'signUpFailed';
  static const String noInternetConnection = 'noInternetConnection';
  static const String sessionExpired = 'sessionExpired';
  static const String invalidRequest = 'invalidRequest';
  static const String resourceNotFound = 'resourceNotFound';
  static const String invalidDataProvided = 'invalidDataProvided';
  static const String connectionTimedOut = 'connectionTimedOut';
  static const String serverError = 'serverError';
  static const String unknownServerError = 'unknownServerError';
  static const String unexpectedApiError = 'unexpectedApiError';
}

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

String localizeMessage(BuildContext context, String message) {
  final l10n = context.l10n;
  final normalized = message.trim().replaceFirst('Exception: ', '');

  if (normalized.startsWith(AppMessageKey.loginFailed) ||
      normalized.startsWith('login failed')) {
    return l10n.loginFailed;
  }

  if (normalized.startsWith(AppMessageKey.signUpFailed) ||
      normalized.startsWith('Sign up failed')) {
    return l10n.signUpFailed;
  }

  switch (normalized) {
    case AppMessageKey.loginFailed:
    case 'Login failed':
      return l10n.loginFailed;
    case AppMessageKey.signUpFailed:
    case 'Sign up failed':
      return l10n.signUpFailed;
    case 'Email is required':
      return l10n.emailRequired;
    case AppMessageKey.noInternetConnection:
      return l10n.noInternetConnection;
    case AppMessageKey.sessionExpired:
      return l10n.sessionExpired;
    case AppMessageKey.invalidRequest:
      return l10n.invalidRequest;
    case AppMessageKey.resourceNotFound:
      return l10n.resourceNotFound;
    case AppMessageKey.invalidDataProvided:
      return l10n.invalidDataProvided;
    case AppMessageKey.connectionTimedOut:
      return l10n.connectionTimedOut;
    case AppMessageKey.serverError:
      return l10n.serverError;
    case AppMessageKey.unknownServerError:
      return l10n.unknownServerError;
    case AppMessageKey.unexpectedApiError:
      return l10n.unexpectedApiError;
    case 'no internet connection':
      return l10n.noInternetConnection;
    case 'Please enter a valid email address':
      return l10n.validEmailRequired;
    case 'Password is required':
      return l10n.passwordRequired;
    case 'Password must be at least 6 characters':
      return l10n.passwordMinLength;
    case 'Name is required':
      return l10n.nameRequired;
    case 'Name must be at least 2 characters long':
      return l10n.nameMinLength;
    case 'Session expired. Please log in again.':
      return l10n.sessionExpired;
    case 'Invalid request. Please check your input.':
      return l10n.invalidRequest;
    case 'Requested resource not found.':
      return l10n.resourceNotFound;
    case 'Invalid data provided.':
      return l10n.invalidDataProvided;
    case 'Connection timed out.':
      return l10n.connectionTimedOut;
    case 'Server Error':
      return l10n.serverError;
    case 'Unknown server error':
      return l10n.unknownServerError;
    case 'Unexpected API Error':
      return l10n.unexpectedApiError;
    default:
      return normalized;
  }
}
