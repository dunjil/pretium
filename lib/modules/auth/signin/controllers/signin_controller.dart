import 'dart:developer';
import 'package:pretium_app/utils/exports.dart';

class SignInController extends GetxController {
  final signInFormKey = GlobalKey<FormState>();

  bool _isLoading = false;
  get isLoading => _isLoading;
  setLoadingState(bool val) {
    _isLoading = val;
    update();
  }

  bool signInPasswordVisibility = false;

  togglePasswordVisibility() {
    signInPasswordVisibility = !signInPasswordVisibility;
    update();
  }

  bool rememberMe = false;

  toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signIn() async {
    if (signInFormKey.currentState!.validate()) {
      log("Login");
      Get.toNamed(Routes.APP_NAVIGATION);
    }
  }
}
