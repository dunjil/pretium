import 'package:pretium_app/utils/exports.dart';

class OnboardingContent {
  String image;
  String title;
  String desc;

  OnboardingContent(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: "Direct Pay",
    desc: "Pay with crypto across Africa effortlessly",
    image: SvgAssets.paymentIcon,
  ),
  OnboardingContent(
    title: "Accept Payments",
    desc:
        "Accept stablecoin payments hassle-free",
    image: SvgAssets.receive,
  ),
  OnboardingContent(
    title: "Pay Bills",
    desc: "Pay for utility services and earn rewards",
    image: SvgAssets.billsIcon,
  ),
];
