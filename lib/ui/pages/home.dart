import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:stockpilelite/backend/auth_service.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = GetIt.I<AuthService>();
  int currentIndex = 0;
  var pages = [
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: WillPopScope(
        onWillPop: _showLogOutConfirmation,
        child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(children: [
                Icon(LineAwesomeIcons.dropbox),
                Text('StockPile', style: TextStyle(fontFamily: 'Carter'))
              ]),
              actions: [
                IconButton(
                    icon: Icon(LineAwesomeIcons.sign_out),
                    onPressed: _showLogOutConfirmation)
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Stocks', icon: Icon(LineAwesomeIcons.inbox)),
                  Tab(text: 'Credit Records', icon: Icon(LineAwesomeIcons.list))
                ],
              )),
          body: TabBarView(
            children: pages,
          ),
        ),
      ),
    );
  }

  Future<bool> _showLogOutConfirmation() {
    return showDialog<AlertDialog>(context: context, builder: (context) {
      return AlertDialog(title: Text('Confirm Logout'), actions: [
        MaterialButton(
            color: AppColor.error,
            onPressed: () => Navigator.pop(context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Icon(LineAwesomeIcons.times)),
        MaterialButton(
            color: AppColor.primary,
            onPressed: () {
              Navigator.pop(context);
              closeAndLogout();
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Icon(LineAwesomeIcons.check)),
      ]);
    }) ?? false;
  }

  void closeAndLogout() {
    authService.logOut();
    Navigator.pop(context);
  }
}
