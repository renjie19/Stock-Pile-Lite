import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stockpilelite/backend/customer/customer_repository.dart';
import 'package:stockpilelite/backend/customer/customer_service.dart';
import 'package:stockpilelite/backend/item/item_repository.dart';
import 'package:stockpilelite/backend/item/item_service.dart';
import 'package:stockpilelite/backend/user/user_repository.dart';
import 'package:stockpilelite/backend/user/user_service.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_repository.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_service.dart';

class StockPileLite {
  static initialize() async {
    await Hive.initFlutter();
    GetIt.I.registerSingleton<UserRepository>(UserRepository());
    GetIt.I.registerSingleton<UserService>(UserService());
    GetIt.I.registerSingleton<UserProfileRepository>(UserProfileRepository());
    GetIt.I.registerSingleton<UserProfileService>(UserProfileService());
    GetIt.I.registerSingleton<ItemRepository>(ItemRepository());
    GetIt.I.registerSingleton<ItemService>(ItemService());
    GetIt.I.registerSingleton<CustomerRepository>(CustomerRepository());
    GetIt.I.registerSingleton<CustomerService>(CustomerService());
  }
}