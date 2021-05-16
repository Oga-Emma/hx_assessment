import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/controller/app_router.dart';
import 'package:hagglex/model/podo/user.dart';
import 'package:hagglex/view/screens/auth/login_screen.dart';
import 'package:hagglex/view/utils/assets.dart';
import 'package:hagglex/view/widgets/gradient_background.dart';
import 'package:hagglex/view/widgets/h_button.dart';
import 'package:helper_widgets/empty_space.dart';

class EmailVerificationSuccess extends StatelessWidget {
  EmailVerificationSuccess({Key key}) : super(key: key);

  final AppRouter router = Get.find();
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Assets.email_verification_success_png,
                      height: 70,
                    ),
                    EmptySpace.v3(),
                    Text("Setup Complete",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    EmptySpace(),
                    Text(
                      "Thank you for setting up your HaggleX account",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: Get.height / 4),
            Expanded(
                flex: 1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HButton(
                        labelText: "START EXPLORING",
                        onPressed: () {
                          router.home();
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
