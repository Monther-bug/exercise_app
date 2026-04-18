// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get loginTitle => 'صفحة تسجيل الدخول';

  @override
  String get signUpTitle => 'صفحة إنشاء حساب';

  @override
  String get userName => 'الاسم';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get signUpButton => 'إنشاء حساب';

  @override
  String get loginButton => 'تسجيل دخول';

  @override
  String get successMessage => 'تم إنشاء المستخدم بنجاح!';

  @override
  String get emailHint => 'name@domain.com';

  @override
  String get loginSuccessMessage => 'تم تسجيل الدخول';

  @override
  String get signUpSuccessMessage => 'تم إنشاء الحساب';

  @override
  String get orConnectWith => 'أو المتابعة عبر';

  @override
  String get googleButton => 'جوجل';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get signUpLink => 'إنشاء حساب';

  @override
  String get loginLink => 'تسجيل الدخول';

  @override
  String get searchHint => 'بحث';

  @override
  String get homeTab => 'الرئيسية';

  @override
  String get favoritesTab => 'المفضلة';

  @override
  String get favoritesTitle => 'المفضلة';

  @override
  String get exerciseDetailsTitle => 'تفاصيل التمرين';

  @override
  String get difficultyLabel => 'الصعوبة';

  @override
  String get muscleLabel => 'العضلة';

  @override
  String get equipmentsLabel => 'المعدات';

  @override
  String get viewInstructions => 'عرض التعليمات';

  @override
  String get instructionsTitle => 'التعليمات';

  @override
  String get noDataFound => 'لا توجد بيانات';

  @override
  String get appTitle => 'تطبيق التمارين';

  @override
  String exerciseTypeTraining(Object type) {
    return 'تمرين $type';
  }

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get validEmailRequired => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordMinLength => 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';

  @override
  String get nameRequired => 'الاسم مطلوب';

  @override
  String get nameMinLength => 'يجب أن يكون الاسم حرفين على الأقل';

  @override
  String get noInternetConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get sessionExpired => 'انتهت الجلسة. يرجى تسجيل الدخول مرة أخرى.';

  @override
  String get invalidRequest => 'الطلب غير صالح. يرجى التحقق من البيانات.';

  @override
  String get resourceNotFound => 'المورد المطلوب غير موجود.';

  @override
  String get invalidDataProvided => 'تم تقديم بيانات غير صالحة.';

  @override
  String get connectionTimedOut => 'انتهت مهلة الاتصال.';

  @override
  String get loginFailed => 'فشل تسجيل الدخول';

  @override
  String get signUpFailed => 'فشل إنشاء الحساب';

  @override
  String get serverError => 'خطأ في الخادم';

  @override
  String get unknownServerError => 'خطأ خادم غير معروف';

  @override
  String get unexpectedApiError => 'خطأ غير متوقع في واجهة البرمجة';

  @override
  String get onboardingTitle1 => '1';

  @override
  String get onboardingTitle2 => '2';

  @override
  String get onboardingTitle3 => '3';

  @override
  String get onboardingDescription1 => 'الصفحة';

  @override
  String get onboardingDescription2 => 'الصفحة';

  @override
  String get onboardingDescription3 => 'الصفحة';
}
