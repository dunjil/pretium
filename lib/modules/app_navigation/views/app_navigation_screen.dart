import 'package:pretium_app/modules/app_navigation/views/widgets/transaction_type_bottomsheet.dart';
import 'package:pretium_app/utils/assets.dart';
import 'package:pretium_app/utils/exports.dart';

class AppNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setSystemOverlayStyle(navigationColor: AppColors.whiteColor);
    return GetBuilder<AppNavigationController>(
      builder: (appNavigationController) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: appNavigationController
              .screens[appNavigationController.currentScreenIndex],
          backgroundColor: AppColors.whiteColor,
          bottomNavigationBar: BottomAppBar(
            surfaceTintColor: AppColors.transparent,
            padding: const EdgeInsets.all(0.0),
            color: AppColors.primaryColor.withOpacity(0.1),
            elevation: 6,
            shape: const CircularNotchedRectangle(),
            // notchMargin: 12.sp,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    45.r,
                  ),
                  topRight: Radius.circular(
                    45.r,
                  ),
                ),
              ),
              height: 60.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    child: BottomNavItem(
                      index: 0,
                      activeIcon: SvgAssets.receive,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                          Get.bottomSheet(
                            TransactionTypeBottomsheet(),
                            backgroundColor: AppColors.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.sp),
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                SvgAssets.qr,
                                height: 30.sp,
                                color: AppColors.whiteColor,
                                width: 30.sp,
                              ),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: BottomNavItem(
                      index: 2,
                      activeIcon: SvgAssets.billsIcon,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String activeIcon;
  final int index;
  final int iconSize;
  const BottomNavItem(
      {super.key,
      required this.activeIcon,
      this.iconSize = 25,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppNavigationController>(
      builder: (homeController) => Container(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            homeController.changeScreenIndex(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                activeIcon,
                height: iconSize.sp,
                color: index == homeController.currentScreenIndex
                    ? AppColors.primaryColor
                    : AppColors.blackColor,
                width: iconSize.sp,
              ),
              SizedBox(
                height: 5.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
