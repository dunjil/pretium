import 'package:pretium_app/modules/auth/signup/views/verify_account_screen.dart';
import 'package:pretium_app/utils/exports.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBindings(),
    ),

    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInScreen(),
      binding: SignInBindings(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingScreen(),
      binding: OnboardingBindings(),
    ),

    GetPage(
      name: _Paths.SIGNUP_SCREEN,
      page: () => const SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: _Paths.VERIFY_ACCOUNT_SCREEN,
      page: () => const VerifyAccountScreen(),
      binding: SignUpBindings(),
    ),
    //
    // GetPage(
    //   name: _Paths.SIGNUP_OTP_SCREEN,
    //   page: () => SignUpOtpScreen(),
    //   binding: SignUpBindings(),
    // ),
    // GetPage(
    //   name: _Paths.SIGNUP_SUCCESS_SCREEN,
    //   page: () => SignUpSuccessScreen(),
    //   binding: SignUpBindings(),
    // ),

    // GetPage(
    //   name: _Paths.RESET_PASSWORD_EMAIL_ENTRY_SCREEN,
    //   page: () => const ResetPasswordEmailEntry(),
    //   binding: PasswordResetBinding(),
    // ),
    // GetPage(
    //   name: _Paths.RESET_PASSWORD_OTP_SCREEN,
    //   page: () => ResetPasswordOtpScreen(),
    //   binding: PasswordResetBinding(),
    // ),
    // GetPage(
    //   name: _Paths.RESET_PASSWORD_NEW_PASSWORD_SCREEN,
    //   page: () => const NewPasswordScreen(),
    //   binding: PasswordResetBinding(),
    // ),
    GetPage(
      name: _Paths.APP_NAVIGATION,
      page: () => AppNavigationScreen(),
      binding: AppNavigationBinding(),
    ),
  ];
}
