import 'package:pretium_app/utils/exports.dart';

class CountrySelector extends StatelessWidget {
  final String value;
  final bool isSelected;
  final Function onSelected;
  final bool isLastItem;
  const CountrySelector(
      {super.key,
      required this.onSelected,
      required this.value,
      this.isSelected = false,
      this.isLastItem = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onSelected();
            },
            child: SizedBox(
              height: 35.sp,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(value,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.blackColor),
                  isSelected
                      ? Icon(
                          Icons.check,
                          color: AppColors.primaryColor,
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          isLastItem
              ? Divider(
                  height: 1.sp,
                  thickness: 1.5.sp,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class CountryBottomSheet extends StatelessWidget {
  final String title;
  final Function onSelected;
  final String selectedValue;
  const CountryBottomSheet(
      {super.key,
      this.title = "Select Country",
      required this.onSelected,
      this.selectedValue = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.sp,
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 10.sp),
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
                onSelected: () {},
                value: countries[index],
                isSelected: countries[index] == selectedValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
