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

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with ErrorHandler {
  var formKey = GlobalKey<FormState>();

  bool _autovalidate = false;

  var countryCode = "+234";
  var country = "Nigeria";
  var phoneController = TextEditingController();

  String email;
  String username;
  String password;
  String phoneNumberDetails;
  String phoneNumber;
  String phone;
  String flag;
  String currency;
  String referralCode;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  final AppRouter router = Get.find();
  final AppController appController = Get.find();
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var overlay =
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlay,
      child: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  EmptySpace.h2(),
                  FlatButton(
                      padding: EdgeInsets.zero,
                      minWidth: 50,
                      color: Colors.white.withOpacity(0.2),
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 36,
                      )),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
                                Text(
                                  "Create a new account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                EmptySpace.v4(),
                                HTextFormField(
                                  validator: Validators.validateEmail(),
                                  labelText: "Email Address",
                                  onSaved: (value) {
                                    email = value.trim();
                                  },
                                  inverted: true,
                                ),
                                EmptySpace.v4(),
                                HTextFormField(
                                  validator: Validators.validatePlainPass(
                                      minLength: 8),
                                  obscureText: true,
                                  labelText: "Password (Min 8 characters)",
                                  onSaved: (value) {
                                    password = value.trim();
                                  },
                                  inverted: true,
                                ),
                                EmptySpace.v4(),
                                HTextFormField(
                                  validator: Validators.validateString(),
                                  labelText: "Create a username",
                                  onSaved: (value) {
                                    username = value.trim();
                                  },
                                  inverted: true,
                                ),
                                EmptySpace.v4(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey[200],
                                      ),
                                      child: CountryListPick(
                                        appBar: getAppBar(context,
                                            title: "Select country"),

                                        // if you need custom picker use this
                                        pickerBuilder:
                                            (context, CountryCode countryCode) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                countryCode.flagUri,
                                                package: 'country_list_pick',
                                                height: 20,
                                                width: 30,
                                                fit: BoxFit.fill,
                                              ),
                                              EmptySpace(),
                                              Text(
                                                "(${countryCode.dialCode})",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          );
                                        },

                                        // To disable option set to false
                                        theme: CountryTheme(
                                          isShowFlag: true,
                                          isShowTitle: true,
                                          isShowCode: true,
                                          isDownIcon: false,
                                          showEnglishName: true,
                                        ),
                                        // Set default value
                                        initialSelection: "NG",
                                        onChanged: (CountryCode code) {
                                          setState(() {
                                            country = code.name;
                                            countryCode = code.dialCode;
                                          });
                                        },
                                      ),
                                    ),
                                    EmptySpace(),
                                    Expanded(
                                      child: HTextFormField(
                                        validator: (value) {
                                          return Validators.validateSimplePhone(
                                              value);
                                        },
                                        labelText: "Enter your phone number",
                                        onSaved: (value) {
                                          phone = value.trim();
                                        },
                                        inverted: true,
                                      ),
                                    ),
                                  ],
                                ),
                                EmptySpace.v4(),
                                HTextFormField(
                                  labelText: "Referral Code (optional)",
                                  onSaved: (value) {
                                    referralCode = value.trim();
                                  },
                                  inverted: true,
                                ),
                                EmptySpace.v4(),
                                Text(
                                    "By signing, you agree to HaggleX terms and privacy policy."),
                                EmptySpace.v4(),
                                HButton.gradient(
                                    loading: _loading,
                                    labelText: "SIGN UP",
                                    onPressed: signup),
                                EmptySpace.v4(),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signup() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        if (phone.startsWith('0')) {
          phone = phone.substring(1);
        }

        var phoneNumber = countryCode + phone;
        Map<String, dynamic> data = {
          "email": email,
          "username": username,
          "password": password,
          "phonenumber": phoneNumber,
          "phoneNumberDetails": {
            "phoneNumber": phone,
            "callingCode": countryCode,
            "flag": "nigeria",
          },
          "country": country,
          "currency": "NGN",
        };

        if (referralCode != null) {
          data["referralCode"] = referralCode;
        }

        toggleLoading();
        var usr = await controller.createAccount(data);
        appController.user = usr;
        router.home();
        toggleLoading();
      } catch (err) {
        toggleLoading();

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

  var _loading = false;
  toggleLoading() {
    setState(() {
      _loading = !_loading;
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
