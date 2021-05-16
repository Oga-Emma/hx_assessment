import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/controller/app_router.dart';
import 'package:hagglex/model/podo/user.dart';
import 'package:hagglex/view/screens/auth/login_screen.dart';
import 'package:hagglex/view/utils/assets.dart';
import 'package:hagglex/view/widgets/gradient_background.dart';
import 'package:helper_widgets/empty_space.dart';

class EmailVerificationSuccess extends StatelessWidget {
  EmailVerificationSuccess({Key key}) : super(key: key);

  final AppRouter router = Get.find();
  final AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: FutureBuilder<User>(
          future: appController.getUserFromCache(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              Future.delayed(Duration.zero, () {
                router.home();
              });
            } else if (snapshot.hasError) {
              Future.delayed(Duration(seconds: 3), () {
                router.login();
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
