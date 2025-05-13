import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretium_app/modules/onboarding/widgets/onbaording_content.dart';
import 'package:pretium_app/utils/exports.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (onboardingController) {
      return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            height: 1.sh,
            width: 1.sw,
            child: Column(
              children: [
                // Top row with Skip button
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: onboardingController.currentPageIndex !=
                              contents.length - 1,
                          replacement: SizedBox(height: 19.sp),
                          child: InkWell(
                            onTap: () {
                              onboardingController.moveToLastIndex();
                            },
                            child: customText(
                              "Skip",
                              textAlign: TextAlign.center,
                              fontSize: 14.sp,
                              color:
                                  AppColors.obscureTextColor.withOpacity(0.6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Main PageView
                Expanded(
                  flex: 7,
                  child: PageView.builder(
                    controller: onboardingController.pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: contents.length,
                    onPageChanged: (int index) {
                      onboardingController.nextIndex(index);
                    },
                    itemBuilder: (_, i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 110.sp,
                            height: 110.sp,
                            padding: EdgeInsets.all(22.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor.withOpacity(0.15),
                            ),
                            child: SvgPicture.asset(
                              contents[i].image,
                              color: AppColors.primaryColor,
                              height: 45.sp,
                              width: 45.sp,
                            ),
                          ),
                          SizedBox(height: 45.sp),
                          customText(contents[i].title,
                              textAlign: TextAlign.center,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor),
                          SizedBox(height: 15.sp),
                          customText(
                            contents[i].desc,
                            color: AppColors.blackColor,
                            textAlign: TextAlign.center,
                            fontSize: 16.sp,
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Bottom Section (Indicator + Button)
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(),
                      AnimatedSmoothIndicator(
                        activeIndex: onboardingController.currentPageIndex,
                        count: contents.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primaryColor,
                          dotColor: AppColors.primaryColor.withOpacity(0.6),
                          dotWidth: 8.sp,
                          dotHeight: 8.sp,
                        ),
                      ),
                      SizedBox(height: 20.sp),
                      CustomButton(
                        onPressed: () {
                          if (onboardingController.currentPageIndex !=
                              contents.length - 1) {
                            onboardingController.autoNextIndex();
                          } else {
                            Get.toNamed(Routes.SIGN_IN);
                          }
                        },
                        width: 1.sw * 0.80,
                        fontWeight: FontWeight.w600,
                        title: onboardingController.currentPageIndex !=
                                contents.length - 1
                            ? "Next"
                            : "Get Started",
                        backgroundColor: AppColors.primaryColor,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
