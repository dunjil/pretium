import 'package:pretium_app/utils/exports.dart';
import 'package:pretium_app/utils/widgets/country_selector.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return Form(
        key: signUpController.verifyAccountFormKey,
        child: Scaffold(
          appBar: defaultAppBar(
            bgColor: AppColors.whiteColor,
          ),
          backgroundColor: AppColors.whiteColor,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 12.sp),
            height: 1.sh,
            width: 1.sw,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  customText("Verify Account",
                      color: AppColors.blackColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 5.sp,
                  ),
                  customText("Enter the verification code sent to your email",
                      color: AppColors.blackColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal),
                  SizedBox(
                    height: 25.sp,
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  CustomRoundedInputField(
                    label: "Nigeria",
                    suffixWidget: InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            height: 400.sp,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.sp, vertical: 10.sp),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: 70.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.obscureTextColor
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(15.r),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customText("Select Country",
                                          fontSize: 23.sp,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w700),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  ...List.generate(
                                    countries.length,
                                    (index) => CountrySelector(
                                      onSelected: () {
                                        signUpController
                                            .verifyAccountCountryController
                                            .text = countries[index];
                                        signUpController.update();
                                      },
                                      value: countries[index],
                                      isSelected: countries[index] ==
                                          signUpController
                                              .verifyAccountCountryController
                                              .text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          backgroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: AppColors.obscureTextColor,
                          size: 25.sp,
                        ),
                      ),
                    ),
                    readOnly: true,
                    labelColor: AppColors.primaryColor,
                    showLabel: true,
                    isRequired: true,
                    useCustomValidator: true,
                    hasTitle: false,
                    keyboardType: TextInputType.text,
                    controller: signUpController.verifyAccountCountryController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your country';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  CustomRoundedInputField(
                    label: "1234",
                    suffixWidget: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Icon(
                        Icons.security,
                        size: 25.sp,
                      ),
                    ),
                    labelColor: AppColors.primaryColor,
                    showLabel: true,
                    isRequired: true,
                    useCustomValidator: true,
                    hasTitle: false,
                    keyboardType: TextInputType.text,
                    controller: signUpController.verifyAccountOTPController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the otp sent to your email';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  CustomButton(
                    onPressed: () {
                      signUpController.verifyAccount();
                    },
                    isBusy: signUpController.isLoading,
                    title: "Verify Account",
                    width: 1.sw,
                    backgroundColor: AppColors.primaryColor,
                    fontColor: AppColors.whiteColor,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText("Didn't receive the code?",
                          color: AppColors.obscureTextColor, fontSize: 15.sp),
                      SizedBox(
                        width: 12.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: customText("Resend code",
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
