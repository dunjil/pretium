import 'package:pretium_app/utils/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.title = "",
      required this.onPressed,
      this.backgroundColor = AppColors.redColor,
      this.fontColor = AppColors.whiteColor,
      this.borderColor = Colors.transparent,
      this.width = 260,
      this.height = 52,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600,
      this.isBusy = false,
      this.icon = Icons.arrow_forward_outlined});
  final String title;
  final Function onPressed;
  final Color backgroundColor;
  final Color fontColor;
  final IconData icon;
  final double width;
  final double height;
  final double fontSize;
  final Color borderColor;
  final FontWeight fontWeight;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isBusy ? print("Is Busy") : onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
        height: height.sp,
        width: width.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: borderColor, width: 1.sp),
            color: backgroundColor),
        child: Center(
          child: isBusy
              ? SizedBox(
                  height: 25.sp,
                  width: 25.sp,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: fontColor,
                  ),
                )
              : customText(title,
                  fontSize: fontSize.sp,
                  color: fontColor,
                  fontWeight: fontWeight),
        ),
      ),
    );
  }
}
