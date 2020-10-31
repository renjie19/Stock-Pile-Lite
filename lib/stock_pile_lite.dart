import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stockpilelite/backend/auth_service.dart';
import 'package:stockpilelite/backend/credit/credit_record_service.dart';
import 'package:stockpilelite/backend/credit/credit_repository.dart';
import 'package:stockpilelite/backend/customer/customer_repository.dart';
import 'package:stockpilelite/backend/customer/customer_service.dart';
import 'package:stockpilelite/backend/item/item_repository.dart';
import 'package:stockpilelite/backend/item/item_service.dart';
import 'package:stockpilelite/backend/payment/payment_repostitory.dart';
import 'package:stockpilelite/backend/payment/payment_service.dart';
import 'package:stockpilelite/backend/user/user_repository.dart';
import 'package:stockpilelite/backend/user/user_service.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_repository.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_service.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_user_facade.dart';
import 'package:stockpilelite/shared/utils/user_profile_tracker.dart';

class StockPileLite {
  static initialize() async {
    await Hive.initFlutter();
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<ItemRepository>(ItemRepository());
    getIt.registerSingleton<UserRepository>(UserRepository());
    getIt.registerSingleton<UserProfileRepository>(UserProfileRepository());
    getIt.registerSingleton<CreditRepository>(CreditRepository());
    getIt.registerSingleton<CustomerRepository>(CustomerRepository());
    getIt.registerSingleton<PaymentRepository>(PaymentRepository());

    getIt.registerSingleton<UserService>(UserService());
    getIt.registerSingleton<UserProfileService>(UserProfileService());
    getIt.registerSingleton<UserProfileTracker>(UserProfileTracker());
    getIt.registerSingleton<AuthService>(AuthService());
    getIt.registerSingleton<ItemService>(ItemService());
    getIt.registerSingleton<CustomerService>(CustomerService());
    getIt.registerSingleton<CreditRecordService>(CreditRecordService());
    getIt.registerSingleton<PaymentService>(PaymentService());
    getIt.registerSingleton<UserProfileUserFacade>(UserProfileUserFacade());

    await GetIt.I<ItemRepository>().initializeBox();
    await GetIt.I<UserRepository>().initializeBox();
    await GetIt.I<UserProfileRepository>().initializeBox();
    await GetIt.I<CreditRepository>().initialize();
    await GetIt.I<CustomerRepository>().initialize();
    await GetIt.I<PaymentRepository>().initialize();
  }
}