// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const SIGNUP_SCREEN = _Paths.SIGNUP_SCREEN;
  static const RESET_PASSWORD_EMAIL_ENTRY_SCREEN =
      _Paths.RESET_PASSWORD_EMAIL_ENTRY_SCREEN;
  static const RESET_PASSWORD_NEW_PASSWORD_SCREEN =
      _Paths.RESET_PASSWORD_NEW_PASSWORD_SCREEN;
  static const RESET_PASSWORD_OTP_SCREEN = _Paths.RESET_PASSWORD_OTP_SCREEN;
  static const RESET_PASSWORD_SUCCESS_SCREEN =
      _Paths.RESET_PASSWORD_SUCCESS_SCREEN;
  static const DASHBOARD = _Paths.DASHBOARD;

  static const APP_NAVIGATION = _Paths.APP_NAVIGATION;
  static const VERIFY_ACCOUNT_SCREEN = _Paths.VERIFY_ACCOUNT_SCREEN;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const ONBOARDING = '/onboarding';
  static const SIGN_IN = '/sign_in';
  static const SIGNUP_SCREEN = '/signup_screen';
  static const VERIFY_ACCOUNT_SCREEN = '/verify_account_screen';
  static const RESET_PASSWORD_EMAIL_ENTRY_SCREEN =
      '/reset_password_email_entry_screen';
  static const RESET_PASSWORD_NEW_PASSWORD_SCREEN =
      '/reset_password_new_password_screen';
  static const RESET_PASSWORD_OTP_SCREEN = '/reset_password_otp_screen';
  static const RESET_PASSWORD_SUCCESS_SCREEN = '/reset_password_success_screen';
  static const DASHBOARD = '/dashboard';

  static const APP_NAVIGATION = '/app_navigation';
}
