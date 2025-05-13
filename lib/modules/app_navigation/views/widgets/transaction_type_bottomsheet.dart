import 'package:pretium_app/utils/exports.dart';

class TransactionTypeBottomsheetItem extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final Function onPressed;
  const TransactionTypeBottomsheetItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.description,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          width: 1.sw,
          margin: EdgeInsets.symmetric(vertical: 10.sp),
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(17.r)),
                padding: EdgeInsets.all(8.sp),
                child: SvgPicture.asset(
                  icon,
                  height: 25.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 15.sp,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(title,
                      color: AppColors.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: 2.h,
                  ),
                  customText(description,
                      color: AppColors.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionTypeBottomsheet extends StatelessWidget {
  const TransactionTypeBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.sp,
      padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 10.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 70.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: AppColors.obscureTextColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TransactionTypeBottomsheetItem(
              title: "Deposit",
              description: "Send crypto to your Pretium wallet",
              onPressed: () {},
              icon: SvgAssets.downArrow,
            ),
            TransactionTypeBottomsheetItem(
              title: "Withdraw",
              description: "Transfer crypto from your Pretium wallet",
              onPressed: () {},
              icon: SvgAssets.callArrow,
            ),
            SizedBox(
              height: 8.sp,
            ),
          ],
        ),
      ),
    );
  }
}
