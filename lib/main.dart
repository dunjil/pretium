import 'package:flutter/services.dart';
import 'package:pretium_app/utils/exports.dart';

void main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(PretiumApp());
}

class PretiumApp extends StatelessWidget {
  const PretiumApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pretium',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
