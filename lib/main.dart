import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/di/di_setup.dart';
import 'package:hagglex/view/screens/auth/login_screen.dart';
import 'package:hagglex/view/screens/auth/signup_screen.dart';
import 'package:hagglex/view/screens/home/dashboard/dashboard_screen.dart';
import 'package:hagglex/view/screens/home/home_screen.dart';
import 'package:hagglex/view/screens/splash/splash_screen.dart';
import 'package:hagglex/view/utils/pallet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HaggleX',
      theme: ThemeData(
          primaryColor: Pallet.primaryColor, accentColor: Pallet.accentColor),
      home: SplashScreen(),
      onInit: () {
        Get.put(AppController());
      },
    );
  }
}
