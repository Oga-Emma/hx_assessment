import 'package:get/get.dart';
import 'package:hagglex/data/remote/service/auth_service.dart';
import 'package:hagglex/di/di_setup.dart';
import 'package:hagglex/model/podo/auth_response.dart';
import 'package:hagglex/model/podo/user.dart';

class AuthController extends GetxController {
  var authService = getIt<AuthService>();

  Future<AuthResponse> login(email, password) {
    return authService.login(email, password);
  }

  Future<User> createAccount(Map<String, dynamic> data) {
    return authService.register(data);
  }
}
