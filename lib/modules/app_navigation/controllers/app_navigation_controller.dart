import 'package:pretium_app/modules/dashboard/views/dashboard_screen.dart';
import 'package:pretium_app/utils/exports.dart';

class AppNavigationController extends GetxController {
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  int currentScreenIndex = 0;
  changeScreenIndex(selectedIndex) {
    currentScreenIndex = selectedIndex;
    update();
  }

  List<Widget> screens = [
    DashboardScreen(),
    Container(
      height: 1.sh,
      width: 1.sw,
      color: AppColors.primaryColor.withOpacity(0.1),
      child:
          Center(child: customText("QR Screen", color: AppColors.primaryColor)),
    ),
    Container(
      height: 1.sh,
      width: 1.sw,
      color: AppColors.primaryColor.withOpacity(0.1),
      child: Center(
          child:
              customText("Transactions Screen", color: AppColors.primaryColor)),
    ),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
