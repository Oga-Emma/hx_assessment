import 'package:hagglex/model/podo/user.dart';

class AuthResponse {
  User user;
  var token;
  var twoFactorAuth = false;

  AuthResponse.fromMap(Map<dynamic, dynamic> data) {
    print("authresponse => $data");
    user = User.fromMap(data['user']);
    token = data['token'];
    twoFactorAuth = data['twoFactorAuth'] ?? false;
  }
}
