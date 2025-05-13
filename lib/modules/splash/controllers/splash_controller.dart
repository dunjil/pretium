import '../../../utils/exports.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    moveToOnboardingScreen();
  }

  void moveToOnboardingScreen() async {
    await Future.delayed(const Duration(milliseconds: 500));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offNamed(Routes.ONBOARDING);
    });
  }
}
