import 'package:flutter_test/flutter_test.dart';
import 'package:hagglex/model/podo/auth_response.dart';
import 'package:hagglex/model/podo/user.dart';

main() {
  group("Testing user model", () {
    var authResponse = AuthResponse.fromMap({
      "token": "token123",
      "user": {
        "email": "test@mail.com",
        "_id": "1234",
        "phonenumber": "+2347012446202",
        "username": "seven",
      }
    });
    test("verify fromMap constructor passes data correctly", () {
      expect(authResponse.token, "token123");
      expect(authResponse.user, isNotNull);
      expect(authResponse.user.id, "1234");
    });
  });
}
