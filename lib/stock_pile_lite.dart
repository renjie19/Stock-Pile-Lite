import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_repository.dart';

import 'backend/user/user_repository.dart';
import 'backend/user/user_service.dart';

class StockPileLite {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    GetIt.I.registerSingleton<UserRepository>(UserRepository());
    GetIt.I.registerSingleton<UserService>(UserService());
    GetIt.I.registerSingleton<UserProfileRepository>(UserProfileRepository());
  }
}