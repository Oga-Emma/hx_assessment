import 'package:flutter_test/flutter_test.dart';
import 'package:hagglex/model/podo/user.dart';

main() {
  group("Testing user model", () {
    var user = User.fromMap({
      "email": "test@mail.com",
      "_id": "1234",
      "phonenumber": "+2347012446202",
      "username": "seven",
    });
    test("verify from map constructor passes data correctly", () {
      expect(user.email, "test@mail.com");
      expect(user.id, "1234");
      expect(user.phonenumber, "+2347012446202");
      expect(user.username, "seven");
    });
  });
}
