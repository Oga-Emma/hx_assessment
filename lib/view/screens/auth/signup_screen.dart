import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:hagglex/view/widgets/gradient_background.dart';
import 'package:hagglex/view/widgets/h_button.dart';
import 'package:hagglex/view/widgets/h_text_form_field.dart';
import 'package:helper_widgets/custom_snackbar/ui_snackbar.dart';
import 'package:helper_widgets/empty_space.dart';
import 'package:helper_widgets/error_handler.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with UISnackBarProvider, ErrorHandler {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  bool _autovalidate = false;

  var countryCode = "+234";
  var country = "Nigeria";
  var phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

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
                      color: Colors.white.withOpacity(0.2),
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 28,
                      ))
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
                        child: ListView(
                          children: [
                            EmptySpace(multiple: 6),
                            Text(
                              "Create a new account",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            EmptySpace.v4(),
                            HTextFormField(
                              labelText: "Email Address",
                              inverted: true,
                            ),
                            EmptySpace.v4(),
                            HTextFormField(
                              labelText: "Password (Min 8 characters)",
                              inverted: true,
                            ),
                            EmptySpace.v4(),
                            HTextFormField(
                              labelText: "Create a username",
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                                    labelText: "Enter your phone number",
                                    inverted: true,
                                  ),
                                ),
                              ],
                            ),
                            EmptySpace.v4(),
                            HTextFormField(
                              labelText: "Referral Code (optional)",
                              inverted: true,
                            ),
                            EmptySpace.v4(),
                            Text(
                                "By signing, you agree to HaggleX terms and privacy policy."),
                            EmptySpace.v4(),
                            HButton.gradient(
                                labelText: "SIGN UP", onPressed: () {})
                          ],
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
}
