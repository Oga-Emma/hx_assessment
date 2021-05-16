import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/controller/app_router.dart';
import 'package:hagglex/view/screens/auth/auth_controller.dart';
import 'package:hagglex/view/screens/auth/signup_screen.dart';
import 'package:hagglex/view/screens/home/home_screen.dart';
import 'package:hagglex/view/widgets/gradient_background.dart';
import 'package:hagglex/view/widgets/h_button.dart';
import 'package:hagglex/view/widgets/h_text_form_field.dart';
import 'package:hagglex/view/widgets/notification_helper.dart';
import 'package:helper_widgets/empty_space.dart';
import 'package:helper_widgets/error_handler.dart';
import 'package:helper_widgets/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ErrorHandler {
  var formKey = GlobalKey<FormState>();

  bool _autovalidate = false;

  String email;
  String password;

  final AppRouter router = Get.find();
  final AppController appController = Get.find();
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Container(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: _autovalidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EmptySpace(
                    multiple: 16,
                  ),
                  Text(
                    "Welcome!",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  EmptySpace(
                    multiple: 6,
                  ),
                  HTextFormField(
                    validator: Validators.validateEmail(),
                    labelText: "Email Address",
                    onSaved: (value) {
                      email = value.trim();
                    },
                  ),
                  EmptySpace.v4(),
                  HTextFormField(
                    validator: Validators.validatePlainPass(minLength: 8),
                    obscureText: true,
                    labelText: "Password (Min 8 characters)",
                    onSaved: (value) {
                      password = value.trim();
                    },
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
                  HButton(
                      loading: _loading, labelText: "LOG IN", onPressed: login),
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
          )),
    );
  }

  login() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        toggleLoading();
        var res = await controller.login(email, password);
        if (res.twoFactorAuth) {
          //handle two factor auth

        }
        appController.user = res.user;
        router.home();
        toggleLoading();
      } catch (err) {
        toggleLoading();
        showError(title: "Login failed", message: getErrorMessage(err));
      }
    } else {
      setState(() {
        _autovalidate = !_autovalidate;
      });
      showError(
          title: "Validation error",
          message: "Please fix all the errors in red");
    }
  }

  var _loading = false;
  toggleLoading() {
    setState(() {
      _loading = !_loading;
    });
  }
}
