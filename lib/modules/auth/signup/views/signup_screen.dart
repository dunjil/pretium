import 'package:pretium_app/utils/exports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return Form(
        key: signUpController.signUpFormKey,
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
                  customText("Create Account",
                      color: AppColors.blackColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: 5.sp,
                  ),
                  customText("Simplify your crypto payments with us",
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
                    label: "First Name",
                    prefixWidget: Icon(
                      Icons.perm_identity_sharp,
                      size: 25.sp,
                    ),
                    labelColor: AppColors.primaryColor,
                    showLabel: true,
                    isRequired: true,
                    useCustomValidator: true,
                    hasTitle: false,
                    keyboardType: TextInputType.text,
                    controller: signUpController.signUpFirstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  CustomRoundedInputField(
                    label: "Last Name",
                    prefixWidget: Icon(
                      Icons.perm_identity_sharp,
                      size: 25.sp,
                    ),
                    labelColor: AppColors.primaryColor,
                    showLabel: true,
                    isRequired: true,
                    useCustomValidator: true,
                    hasTitle: false,
                    keyboardType: TextInputType.text,
                    controller: signUpController.signUpLastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.sp,
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
                    controller: signUpController.signUpEmailController,
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
                    obscureText: !signUpController.signUpPasswordVisibility,
                    hasTitle: false,
                    controller: signUpController.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    suffixWidget: IconButton(
                      onPressed: () {
                        signUpController.togglePasswordVisibility();
                      },
                      icon: Icon(
                        !signUpController.signUpPasswordVisibility
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 20.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: AppColors.primaryColor,
                            checkColor: AppColors.whiteColor,
                            value: signUpController.termsAccepted,
                            onChanged: (val) {
                              signUpController.toggleTermsAcceptance();
                            }),
                        customText("Accept Terms and Conditions",
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      signUpController.signUp();
                    },
                    isBusy: signUpController.isLoading,
                    title: "Create Account",
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
                      customText("Already have an account?",
                          color: AppColors.obscureTextColor, fontSize: 15.sp),
                      SizedBox(
                        width: 12.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP_SCREEN);
                        },
                        child: customText("Login",
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
