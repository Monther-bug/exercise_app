// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Login Page';

  @override
  String get signUpTitle => 'Sign Up Page';

  @override
  String get userName => 'Name';

  @override
  String get emailLabel => 'Email Address';

  @override
  String get passwordLabel => 'Password';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get loginButton => 'Login';

  @override
  String get successMessage => 'User created successfully!';

  @override
  String get emailHint => 'name@domain.com';

  @override
  String get loginSuccessMessage => 'Logged in';

  @override
  String get signUpSuccessMessage => 'Signed up';

  @override
  String get orConnectWith => 'OR CONNECT WITH';

  @override
  String get googleButton => 'Google';

  @override
  String get dontHaveAccount => 'don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get signUpLink => 'Sign up';

  @override
  String get loginLink => 'login';

  @override
  String get searchHint => 'Search';

  @override
  String get homeTab => 'Home';

  @override
  String get favoritesTab => 'Favorites';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get exerciseDetailsTitle => 'Exercise Details';

  @override
  String get difficultyLabel => 'Difficulty';

  @override
  String get muscleLabel => 'Muscle';

  @override
  String get equipmentsLabel => 'Equipments';

  @override
  String get viewInstructions => 'View Instructions';

  @override
  String get instructionsTitle => 'Instructions';

  @override
  String get noDataFound => 'No data found';

  @override
  String get appTitle => 'Exercise app';

  @override
  String exerciseTypeTraining(Object type) {
    return '$type training';
  }

  @override
  String get emailRequired => 'Email is required';

  @override
  String get validEmailRequired => 'Please enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get nameMinLength => 'Name must be at least 2 characters long';

  @override
  String get noInternetConnection => 'no internet connection';

  @override
  String get sessionExpired => 'Session expired. Please log in again.';

  @override
  String get invalidRequest => 'Invalid request. Please check your input.';

  @override
  String get resourceNotFound => 'Requested resource not found.';

  @override
  String get invalidDataProvided => 'Invalid data provided.';

  @override
  String get connectionTimedOut => 'Connection timed out.';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get signUpFailed => 'Sign up failed';

  @override
  String get serverError => 'Server Error';

  @override
  String get unknownServerError => 'Unknown server error';

  @override
  String get unexpectedApiError => 'Unexpected API Error';

  @override
  String get onboardingTitle1 => '1';

  @override
  String get onboardingTitle2 => '2';

  @override
  String get onboardingTitle3 => '3';

  @override
  String get onboardingDescription1 => 'page';

  @override
  String get onboardingDescription2 => 'page';

  @override
  String get onboardingDescription3 => 'page';
}
