import 'package:flutter_test/flutter_test.dart';
import 'package:hagglex/data/local/repository/cache_repo.dart';
import 'package:hagglex/data/local/service/cache_service.dart';
import 'package:hagglex/data/remote/repository/auth_repo.dart';
import 'package:hagglex/data/remote/repository/auth_repo_impl.dart';
import 'package:hagglex/data/remote/service/auth_service.dart';
import 'package:hagglex/data/remote/service/auth_service_impl.dart';
import 'package:hagglex/model/podo/auth_response.dart';
import 'package:hagglex/model/podo/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MockCacheService extends Mock implements CacheService {}

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  final cache = MockCacheService();
  final authRepo = MockAuthRepo();
  final authService = AuthServiceImpl(cache: cache, authRepo: authRepo);

  var email = "test@mail.com";
  var password = "12345678";

  test("testing ot see if everything is set", () {
    expect(email, "test@mail.com");
  });

  group("login", () {
    test("verify login method in auth repo is called", () async {
      when(authRepo.login(email, password)).thenAnswer((realInvocation) =>
          Future.value(AuthResponse(
              token: "123",
              twoFactorAuth: false,
              user: User()..email = email)));
      var response = await authService.login(email, password);
      expect(response.twoFactorAuth, false);
      expect(response.token, "123");
      expect(response.user.email, email);
    });

    test("verify when twofactor verification is true", () async {
      var res = AuthResponse(
          token: "123", twoFactorAuth: true, user: User()..email = email);
      when(authRepo.login(email, password))
          .thenAnswer((realInvocation) => Future.value(res));
      var response = await authService.login(email, password);
      expect(response.twoFactorAuth, true);
    });
  });
}
