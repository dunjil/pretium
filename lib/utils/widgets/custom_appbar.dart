import 'package:flutter/services.dart';
import 'package:pretium_app/utils/exports.dart';

PreferredSize flatAppBar(
    {Color bgColor = AppColors.whiteColor,
    Color navigationColor = AppColors.whiteColor}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(0.sp),
    child: AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      surfaceTintColor: bgColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: [
          AppColors.primaryColor,
          AppColors.primaryColor.withOpacity(0.5),
          AppColors.primaryColor.withOpacity(0.5),
        ].contains(bgColor)
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: navigationColor,
        systemNavigationBarIconBrightness: [
          AppColors.primaryColor,
          AppColors.primaryColor.withOpacity(0.9)
        ].contains(navigationColor)
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarDividerColor: navigationColor,
      ),
    ),
  );
}

PreferredSize defaultAppBar(
    {Widget title = const SizedBox.shrink(),
    Widget leading = const SizedBox.shrink(),
    VoidCallback? onPop,
    Color bgColor = Colors.white,
    bool implyLeading = true,
    Color navigationColor = AppColors.whiteColor,
    bool centerTitle = false,
    Widget actionItem = const SizedBox.shrink()}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(40.0.h), // Adjust the height as needed
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: AppBar(
        title: title, // Added title if needed
        centerTitle: centerTitle,
        foregroundColor: bgColor,
        surfaceTintColor: bgColor,
        automaticallyImplyLeading: implyLeading,
        elevation: 0,
        backgroundColor: bgColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: bgColor,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: navigationColor,
          systemNavigationBarIconBrightness: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.9)
          ].contains(navigationColor)
              ? Brightness.light
              : Brightness.dark,
          systemNavigationBarDividerColor: navigationColor,
        ),
        leading: implyLeading
            ? InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: onPop ?? () => Get.back(),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 20.sp,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                ),
              )
            : leading,
        actions: [actionItem],
      ),
    ),
  );
}

PreferredSize flatEmptyAppBar(
    {Color navigationColor = AppColors.whiteColor,
    Color topColor = AppColors.whiteColor}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(0.sp),
    child: AppBar(
      elevation: 0,
      backgroundColor: topColor,
      surfaceTintColor: topColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: navigationColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: topColor,
        systemNavigationBarIconBrightness:
            navigationColor == AppColors.whiteColor
                ? Brightness.dark
                : Brightness.light,
        systemNavigationBarDividerColor: navigationColor,
      ),
    ),
  );
}

void setSystemOverlayStyle({
  Color navigationColor = AppColors.whiteColor,
  Color topColor = AppColors.whiteColor,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: navigationColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      statusBarColor: topColor,
      systemNavigationBarIconBrightness: navigationColor == AppColors.whiteColor
          ? Brightness.dark
          : Brightness.light,
      systemNavigationBarDividerColor: navigationColor,
    ),
  );
}
