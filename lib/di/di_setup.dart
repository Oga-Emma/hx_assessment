import 'package:get_it/get_it.dart';
import 'package:hagglex/data/local/repository/cache_repo.dart';
import 'package:hagglex/data/local/repository/cache_repo_impl.dart';
import 'package:hagglex/data/local/service/cache_service.dart';
import 'package:hagglex/data/local/service/cache_service_impl.dart';
import 'package:hagglex/data/remote/repository/auth_repo.dart';
import 'package:hagglex/data/remote/repository/auth_repo_impl.dart';
import 'package:hagglex/data/remote/service/auth_service.dart';
import 'package:hagglex/data/remote/service/auth_service_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(sharedPreferences);

  //local cache for things like user session data and token
  getIt.registerLazySingleton<CacheRepo>(
      () => CacheRepoImpl(preferences: getIt()));

  getIt.registerLazySingleton<CacheService>(
      () => CacheServiceImpl(cacheRepo: getIt()));

  //auth service and repository for user managing user profile
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
  getIt.registerLazySingleton<AuthService>(
      () => AuthServiceImpl(cache: getIt(), authRepo: getIt()));
}
