import 'package:hagglex/data/local/repository/cache_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheRepoImpl implements CacheRepo {
  SharedPreferences preferences;
  CacheRepoImpl({this.preferences});
}
