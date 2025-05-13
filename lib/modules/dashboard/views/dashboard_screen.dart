import 'package:pretium_app/modules/dashboard/views/widgets/financial_services_widget.dart';
import 'package:pretium_app/utils/exports.dart';
import 'package:pretium_app/utils/widgets/country_selector.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (dashboardController) {
      return Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(0.1),
        appBar: defaultAppBar(
            centerTitle: true,
            navigationColor: AppColors.whiteColor,
            leading: Container(
              margin: EdgeInsets.symmetric(vertical: 2.h),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.whiteColor),
              child: Center(
                child: customText("D",
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp),
              ),
            ),
            title: customText(
              "Hello, Duna",
              color: AppColors.whiteColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            actionItem: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.whiteColor,
            ),
            bgColor: AppColors.primaryColor,
            implyLeading: false),
        body: Container(
          height: 1.sh,
          width: 1.sw,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(11.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 35.sp,
                            height: 35.sp,
                            padding: EdgeInsets.all(
                              8.sp,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.secondaryColor,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                SvgAssets.receive,
                                color: AppColors.whiteColor,
                                height: 25.sp,
                                width: 25.sp,
                              ),
                            ),
                          ),
                          Container(
                            width: 35.sp,
                            height: 35.sp,
                            padding: EdgeInsets.all(
                              5.sp,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.secondaryColor,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.visibility_outlined,
                                color: AppColors.whiteColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      customText("Wallet Balance",
                          color: AppColors.whiteColor, fontSize: 14.sp),
                      SizedBox(
                        height: 14.h,
                      ),
                      Row(
                        children: [
                          customText(
                            "NGN",
                            color: AppColors.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          customText(" 0.00",
                              color: AppColors.whiteColor,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 7.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: AppColors.secondaryColor,
                        ),
                        child: customText("\$ 0.00",
                            color: AppColors.whiteColor, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  color: AppColors.whiteColor,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(11.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText("Financial Services",
                                color: AppColors.blackColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                            Row(
                              children: [
                                customText(dashboardController.selectedCountry,
                                    color: AppColors.primaryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                                InkWell(
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
                                                  color: AppColors
                                                      .obscureTextColor
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  customText("Select Country",
                                                      fontSize: 23.sp,
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8.sp,
                                              ),
                                              ...List.generate(
                                                countries.length,
                                                (index) => CountrySelector(
                                                  onSelected: () {
                                                    dashboardController
                                                        .setSelectedCountry(
                                                            countries[index]);
                                                  },
                                                  value: countries[index],
                                                  isSelected:
                                                      countries[index] ==
                                                          dashboardController
                                                              .selectedCountry,
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
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.primaryColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GridView.count(
                          crossAxisCount: 3, // 3 items per row
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 0,
                          shrinkWrap:
                              true, // allows GridView inside scrollable views
                          physics:
                              const NeverScrollableScrollPhysics(), // prevent scroll conflict
                          children: const [
                            FinancialServicesWidget(
                                asset: PngAssets.opayIcon, name: "Opay"),
                            FinancialServicesWidget(
                                asset: PngAssets.moniepointIcon,
                                name: "Moniepoint"),
                            FinancialServicesWidget(
                                asset: PngAssets.palmpayIcon, name: "Palmpay"),
                            FinancialServicesWidget(
                                asset: PngAssets.phoneIcon, name: "Airtime"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText("Recent Transactions",
                          color: AppColors.blackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: customText(
                          "See all",
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 55.h,
                    ),
                    SvgPicture.asset(
                      SvgAssets.billsIcon,
                      color: AppColors.obscureTextColor,
                      height: 45.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    customText(
                      "No recent transactions",
                      color: AppColors.obscureTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
