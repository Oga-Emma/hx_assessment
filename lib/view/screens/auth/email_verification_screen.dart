import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/controller/app_router.dart';
import 'package:hagglex/view/screens/auth/auth_controller.dart';
import 'package:hagglex/view/screens/home/home_screen.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:hagglex/view/widgets/gradient_background.dart';
import 'package:hagglex/view/widgets/h_button.dart';
import 'package:hagglex/view/widgets/h_text_form_field.dart';
import 'package:hagglex/view/widgets/notification_helper.dart';
import 'package:helper_widgets/custom_snackbar/ui_snackbar.dart';
import 'package:helper_widgets/empty_space.dart';
import 'package:helper_widgets/error_handler.dart';
import 'package:helper_widgets/validators.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key key}) : super(key: key);

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen>
    with ErrorHandler {
  var formKey = GlobalKey<FormState>();

  bool _autovalidate = false;

  String code;

  final AppRouter router = Get.find();
  final AppController appController = Get.find();
  final AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    var overlay =
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlay,
      child: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    FlatButton(
                        padding: EdgeInsets.zero,
                        minWidth: 50,
                        color: Colors.white.withOpacity(0.2),
                        shape: StadiumBorder(),
                        onPressed: () {
                          appController.logout();
                          router.login();
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 36,
                        ))
                  ],
                ),
                EmptySpace.v4(),
                Text(
                  "Verify your account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                EmptySpace.v4(),
                Expanded(
                  child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: SingleChildScrollView(
                          child: Form(
                            autovalidateMode: _autovalidate
                                ? AutovalidateMode.always
                                : AutovalidateMode.disabled,
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                EmptySpace(multiple: 6),
                                Image.asset(
                                  "assets/img/verify_email.png",
                                  height: 80,
                                ),
                                EmptySpace.v4(),
                                Center(
                                    child: Text(
                                  "We just sent a verification code to your email.\nPlease enter the code",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                )),
                                EmptySpace(multiple: 6),
                                HTextFormField(
                                  validator: Validators.validateString(),
                                  labelText: "Verification Code",
                                  onSaved: (value) {
                                    code = value.trim();
                                  },
                                  inverted: true,
                                ),
                                EmptySpace.v4(),
                                HButton.gradient(
                                    loading: _loading,
                                    labelText: "VERIFY ME",
                                    onPressed: verify),
                                EmptySpace.v4(),
                                Center(
                                    child: Text(
                                  "This code will expire in 10 minutes.",
                                  style: Theme.of(context).textTheme.caption,
                                )),
                                EmptySpace.v4(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Resend Code",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          color: Colors.black,
                                          fontSize: 16),
                                    )),
                                EmptySpace.v4(),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  verify() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        toggleVerifiying();
        var usr = await controller.verifyEmail(code);
        appController.user = usr;
        router.emailVerificationSuccess();
        toggleVerifiying();
      } catch (err) {
        toggleVerifiying();
        showError(
            title: "Error creating account", message: getErrorMessage(err));
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

  resendCode() async {
    try {
      toggleResending();
      var usr = await controller.resendCode();
      appController.user = usr;
      router.home();
      toggleResending();
    } catch (err) {
      toggleResending();

      showError(title: "Error resending code", message: getErrorMessage(err));
    }
  }

  var _loading = false;
  toggleVerifiying() {
    setState(() {
      _loading = !_loading;
    });
  }

  var _resending = false;
  toggleResending() {
    setState(() {
      _resending = !_resending;
    });
  }
}

Widget getAppBar(BuildContext context, {String title}) {
  return AppBar(
    brightness: Brightness.light,
    elevation: 0.0,
    backgroundColor: Pallet.primaryColor,
    centerTitle: true,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(Icons.chevron_left, color: Colors.white),
      ),
    ),
    title: Text("$title"),
  );
}
