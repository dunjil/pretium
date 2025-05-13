import 'package:pretium_app/modules/auth/signup/views/verify_account_screen.dart';
import 'package:pretium_app/utils/exports.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

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
    GetPage(
      name: _Paths.APP_NAVIGATION,
      page: () => AppNavigationScreen(),
      binding: AppNavigationBinding(),
    ),
  ];
}
