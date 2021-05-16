import 'package:get/get.dart';
import 'package:hagglex/data/remote/repository/auth_repo.dart';
import 'package:hagglex/di/di_setup.dart';

class AuthController extends GetxController {
  var authRepo = getIt<AuthRepo>();

  Future login(email, password) {
    return authRepo.login(email, password);
  }
}
