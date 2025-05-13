import 'dart:developer';
import 'package:pretium_app/utils/exports.dart';

class SignUpController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();
  final verifyAccountFormKey = GlobalKey<FormState>();

  bool _isLoading = false;
  get isLoading => _isLoading;
  setLoadingState(bool val) {
    _isLoading = val;
    update();
  }

  bool signUpPasswordVisibility = false;

  togglePasswordVisibility() {
    signUpPasswordVisibility = !signUpPasswordVisibility;
    update();
  }

  bool termsAccepted = false;

  toggleTermsAcceptance() {
    termsAccepted = !termsAccepted;
    update();
  }

  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpFirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signUp() async {
    if (signUpFormKey.currentState!.validate()) {
      Get.toNamed(Routes.VERIFY_ACCOUNT_SCREEN);
      log("Signup");
    }
  }

  TextEditingController verifyAccountCountryController =
      TextEditingController();
  TextEditingController verifyAccountOTPController = TextEditingController();
  verifyAccount() async {
    if (verifyAccountFormKey.currentState!.validate()) {
      Get.toNamed(Routes.APP_NAVIGATION);
      log("account Verified");
    }
  }
}
