import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stockpilelite/ui/pages/login_home.dart';

import 'backend/repository/user/user_repository.dart';

void main() async {
  await Hive.initFlutter();
  GetIt.I.registerSingleton<UserRepository>(UserRepository());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginHome(),
    );
  }
}

