import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretium_app/utils/exports.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (signInController) {
      return Form(
        key: signInController.signInFormKey,
        child: Scaffold(
          appBar: flatEmptyAppBar(
            topColor: AppColors.whiteColor,
          ),
          backgroundColor: AppColors.whiteColor,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 12.sp),
            height: 1.sh,
            width: 1.sw,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 15.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 70.sp,
                    height: 70.sp,
                    padding: EdgeInsets.all(
                      15.sp,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    child: SvgPicture.asset(
                      SvgAssets.receive,
                      color: AppColors.primaryColor,
                      height: 45.sp,
                      width: 45.sp,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  customText("Welcome back!",
                      color: AppColors.blackColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 5.sp,
                  ),
                  customText("Sign in to continue",
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
                    label: "Email",
                    prefixWidget: Icon(
                      Icons.mail_outline,
                      size: 25.sp,
                    ),
                    labelColor: AppColors.primaryColor,
                    showLabel: true,
                    isRequired: true,
                    useCustomValidator: true,
                    hasTitle: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: signInController.loginController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      if (!validateEmail(value)) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  CustomRoundedInputField(
                    prefixWidget: Icon(
                      Icons.lock_open,
                      size: 25.sp,
                    ),
                    label: "Password",
                    labelColor: AppColors.primaryColor,
                    showLabel: true,
                    isRequired: true,
                    useCustomValidator: true,
                    obscureText: !signInController.signInPasswordVisibility,
                    hasTitle: false,
                    controller: signInController.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    suffixWidget: IconButton(
                      onPressed: () {
                        signInController.togglePasswordVisibility();
                      },
                      icon: Icon(
                        !signInController.signInPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 20.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                activeColor: AppColors.primaryColor,
                                checkColor: AppColors.whiteColor,
                                value: signInController.rememberMe,
                                onChanged: (val) {
                                  signInController.toggleRememberMe();
                                }),
                            customText("Remember me",
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            // Get.toNamed(
                            //     Routes.RESET_PASSWORD_EMAIL_ENTRY_SCREEN);
                          },
                          child: customText("Forgot your password?",
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      signInController.signIn();
                    },
                    isBusy: signInController.isLoading,
                    title: "Login",
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
                      customText("Don't have an account?",
                          color: AppColors.obscureTextColor, fontSize: 15.sp),
                      SizedBox(
                        width: 12.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP_SCREEN);
                        },
                        child: customText("Sign Up",
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
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
