import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';
import 'package:stockpilelite/stock_pile_lite.dart';
import 'package:stockpilelite/ui/pages/login.dart';

void main() async {
  await StockPileLite.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColor.primary,
          accentColor: AppColor.secondary,
          brightness: Brightness.light,
          fontFamily: 'Poppins',
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color:  AppColor.primary),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
          )),
      home: LoginHome(),
    );
  }
}
