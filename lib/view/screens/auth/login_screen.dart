import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hagglex/view/screens/auth/auth_controller.dart';
import 'package:hagglex/view/screens/auth/signup_screen.dart';
import 'package:hagglex/view/widgets/gradient_background.dart';
import 'package:hagglex/view/widgets/h_button.dart';
import 'package:hagglex/view/widgets/h_text_form_field.dart';
import 'package:helper_widgets/empty_space.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmptySpace(
              multiple: 16,
            ),
            Text(
              "Welcome!",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            EmptySpace(
              multiple: 6,
            ),
            HTextFormField(
              labelText: "Email Address",
            ),
            EmptySpace.v4(),
            HTextFormField(
              labelText: "Password (Min 8 characters)",
            ),
            EmptySpace.v2(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            EmptySpace.v4(),
            HButton(labelText: "LOG IN", onPressed: () {}),
            EmptySpace.v4(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New User? ",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(SignupScreen());
                  },
                  child: Text(
                    "Create a new account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
