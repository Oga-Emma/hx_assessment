import 'package:get/get.dart';
import 'package:hagglex/model/podo/user.dart';
import 'package:hagglex/view/screens/auth/email_verification_screen.dart';
import 'package:hagglex/view/screens/auth/email_verification_success_screen.dart';
import 'package:hagglex/view/screens/auth/login_screen.dart';
import 'package:hagglex/view/screens/auth/signup_screen.dart';
import 'package:hagglex/view/screens/home/home_screen.dart';
import 'package:hagglex/view/screens/splash/splash_screen.dart';

class AppRouter extends GetxController {
  home() {
    Get.offAllNamed(Routes.HOME);
  }

  login() {
    Get.offAllNamed(Routes.LOGIN);
  }

  signup() {
    Get.toNamed(Routes.SIGNUP);
  }

  emailVerificationScreen() {
    Get.offAllNamed(Routes.VERIFY_EMAIL);
  }

  emailVerificationSuccess() {
    Get.offAllNamed(Routes.EMAIL_VERIFICATION_SUCCESS);
  }
}

class Routes {
  static const SPLASH = "/";
  static const HOME = "/home";
  static const LOGIN = "/login";
  static const SIGNUP = "/signup";
  static const VERIFY_EMAIL = "/verify_email";
  static const EMAIL_VERIFICATION_SUCCESS = "/email_verification_success";

  static getPages() {
    return [
      GetPage(name: SPLASH, page: () => SplashScreen()),
      GetPage(name: HOME, page: () => HomeScreen()),
      GetPage(name: LOGIN, page: () => LoginScreen()),
      GetPage(name: SIGNUP, page: () => SignupScreen()),
      GetPage(name: VERIFY_EMAIL, page: () => EmailVerificationScreen()),
      GetPage(
          name: EMAIL_VERIFICATION_SUCCESS,
          page: () => EmailVerificationSuccess())
    ];
  }
}
