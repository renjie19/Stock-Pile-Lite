import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:stockpilelite/backend/auth_service.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';
import 'package:stockpilelite/shared/utils/user_profile_tracker.dart';
import 'package:stockpilelite/ui/pages/home.dart';
import 'package:stockpilelite/ui/pages/register.dart';

class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  var formKey = GlobalKey<FormBuilderState>();
  bool isNotVisible = true;
  AuthService authService = GetIt.I<AuthService>();

  void checkSession() {
    UserProfileTracker userProfileTracker = GetIt.I<UserProfileTracker>();
    var expired = userProfileTracker.isSessionExpired;
    if (!expired) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Home();
      }));
      userProfileTracker.startSession();
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FormBuilder(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(LineAwesomeIcons.dropbox,
                          size: 90, color: AppColor.primary),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          'Stock',
                          style: TextStyle(
                              color: AppColor.primary,
                              fontFamily: 'Carter',
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Pile',
                          style: TextStyle(
                              color: AppColor.secondary,
                              fontFamily: 'Carter',
                              fontSize: 60,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          FormBuilderTextField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.next,
                            attribute: 'username',
                            decoration: InputDecoration(
                              labelText: 'Username',
                            ),
                            validators: [
                              FormBuilderValidators.required(
                                  errorText: 'Username is required')
                            ],
                          ),
                          SizedBox(height: 10),
                          FormBuilderTextField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
                              attribute: 'password',
                              obscureText: isNotVisible,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: InkWell(
                                      onTap: () => setState(
                                          () => isNotVisible = !isNotVisible),
                                      child: Icon(isNotVisible
                                          ? LineAwesomeIcons.eye_slash
                                          : LineAwesomeIcons.eye))),
                              validators: [
                                FormBuilderValidators.required(
                                    errorText: 'Password is required')
                              ]),
                          SizedBox(height: 30),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                              padding: EdgeInsets.all(15),
                              color: AppColor.primary,
                              textColor: Colors.white,
                              onPressed: _login,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 5),
                            FlatButton(
                              onPressed: _showRegisterForm,
                              padding: EdgeInsets.all(15),
                              shape: ContinuousRectangleBorder(
                                  side: BorderSide(color: AppColor.secondary),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondary,
                                ),
                              ),
                            ),
                          ])
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    try {
      if (formKey.currentState.saveAndValidate()) {
        var values = formKey.currentState.value;
        authService.login(values['username'], values['password']);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Home();
        }));
        formKey.currentState.reset();
      } else {
        BotToast.showSimpleNotification(
            title: 'Please verify fields', backgroundColor: Colors.redAccent);
      }
    } catch (e) {
      BotToast.showSimpleNotification(
          title: e.message, backgroundColor: Colors.redAccent);
    }
  }

  void _showRegisterForm() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }
}
