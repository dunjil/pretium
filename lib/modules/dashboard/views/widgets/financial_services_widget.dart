import 'package:pretium_app/utils/exports.dart';

class FinancialServicesWidget extends StatelessWidget {
  final String asset;
  final String name;
  const FinancialServicesWidget(
      {super.key, required this.asset, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 0.w, bottom: 0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.1),
            ),
            padding: EdgeInsets.all(5.sp),
            child: CircleAvatar(
              radius: 15.r,
              backgroundImage: AssetImage(
                asset,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          customText(
            name,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ],
      ),
    );
  }
}
