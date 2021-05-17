import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/controller/app_router.dart';
import 'package:hagglex/model/podo/user.dart';
import 'package:hagglex/view/screens/auth/login_screen.dart';
import 'package:hagglex/view/utils/assets.dart';
import 'package:hagglex/view/widgets/gradient_background.dart';
import 'package:helper_widgets/empty_space.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);

  final AppRouter router = Get.find();
  final AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: FutureBuilder<bool>(
          future: appController.getUserFromCache(),
          builder: (context, snapshot) {
            if (snapshot.hasError || (snapshot.hasData && !snapshot.data)) {
              Future.delayed(Duration.zero, () {
                router.login();
              });
            } else if (snapshot.hasData && snapshot.data) {
              Future.delayed(Duration(seconds: 3), () {
                router.home();
              });
            }
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.app_logo_white_png,
                  height: 48,
                ),
                EmptySpace.v3(),
                Text(
                  "HaggleX",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ));
          }),
    );
  }
}
