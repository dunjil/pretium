import '../../../../utils/exports.dart';

class SignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
