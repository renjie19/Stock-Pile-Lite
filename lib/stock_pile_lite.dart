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
    GetIt.I.registerSingleton<UserRepository>(UserRepository());
    GetIt.I.registerSingleton<UserService>(UserService());
    GetIt.I.registerSingleton<UserProfileRepository>(UserProfileRepository());
    GetIt.I.registerSingleton<UserProfileService>(UserProfileService());
    GetIt.I.registerSingleton<ItemRepository>(ItemRepository());
    GetIt.I.registerSingleton<ItemService>(ItemService());
    GetIt.I.registerSingleton<CustomerRepository>(CustomerRepository());
    GetIt.I.registerSingleton<CustomerService>(CustomerService());
    GetIt.I.registerSingleton<CreditRepository>(CreditRepository());
    GetIt.I.registerSingleton<CreditRecordService>(CreditRecordService());
    GetIt.I.registerSingleton<PaymentRepository>(PaymentRepository());
    GetIt.I.registerSingleton<PaymentService>(PaymentService());
    GetIt.I.registerSingleton<UserProfileUserFacade>(UserProfileUserFacade());
    GetIt.I.registerSingleton<UserProfileTracker>(UserProfileTracker());
    GetIt.I.registerSingleton<AuthService>(AuthService());
  }
}