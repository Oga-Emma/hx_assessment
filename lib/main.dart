import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hagglex/view/screens/auth/login_screen.dart';
import 'package:hagglex/view/screens/splash/splash_screen.dart';
import 'package:hagglex/view/utils/pallet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initialization.then((value) {
  //   // Get.put(AppController());
  //   // Get.put(UserController());
  //   // Get.put(ProducsController());
  //   // Get.put(CartController());
  //   // Get.put(PaymentsController());
  // });
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
      home: LoginScreen(),
    );
  }
}
