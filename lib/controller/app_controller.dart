import 'package:get/get.dart';
import 'package:hagglex/data/local/service/cache_service.dart';
import 'package:hagglex/di/di_setup.dart';
import 'package:hagglex/model/podo/user.dart';

class AppController extends GetxController {
  var cache = getIt<CacheService>();

  User _user;
  set user(usr) {
    _user = usr;
  }

  User get user => _user;

  Future<User> getUserFromCache() async {
    user = await cache.getUser();
    return user;
  }

  Future logout() async {
    return cache.clearCache();
  }
}
