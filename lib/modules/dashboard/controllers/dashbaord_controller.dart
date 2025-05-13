import 'package:pretium_app/utils/exports.dart';

class DashboardController extends GetxController {
  String selectedCountry = "Nigeria";

  setSelectedCountry(String country) {
    selectedCountry = country;
    update();
  }
}
