import 'package:pretium_app/utils/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                PngAssets.pretaIcon,
              ),
              customText("PRETIUM",
                  textAlign: TextAlign.center,
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor),
            ],
          ),
        ),
      );
    });
  }
}
