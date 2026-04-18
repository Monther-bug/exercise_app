import 'package:exercise_app/l10n/app_localizations.dart';

class FormValidators {
  static String? validateEmail(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.emailRequired;

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return l10n.validEmailRequired;
    }
    return null;
  }

  static String? validatePassword(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.passwordRequired;
    if (value.length < 6) return l10n.passwordMinLength;
    return null;
  }

  static String? validateName(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.nameRequired;
    }
    if (value.length < 2) {
      return l10n.nameMinLength;
    }
    return null;
  }
}
