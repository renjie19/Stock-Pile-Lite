import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';

class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  var formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomPadding: true,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FormBuilder(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(LineAwesomeIcons.dropbox, size: 90, color: AppColor.primary),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          FormBuilderTextField(
                            attribute: 'username',
                            decoration: InputDecoration(
                              labelText: 'Username',
                            ),
                            validators: [
                              MultiValidator([
                                RequiredValidator(
                                    errorText: 'Username is required')
                              ])
                            ],
                          ),
                          SizedBox(height: 10),
                          FormBuilderTextField(
                            attribute: 'password',
                            decoration: InputDecoration(labelText: 'Password'),
                            validators: [
                              MultiValidator([
                                RequiredValidator(
                                    errorText: 'Password is required')
                              ])
                            ],
                          ),
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
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void _login() {
    if (formKey.currentState.saveAndValidate()) {
      // TODO: implement login
    } else {
      BotToast.showSimpleNotification(
          title: 'Please verify fields', backgroundColor: Colors.redAccent);
    }
  }

  void _showRegisterForm() {
    // TODO: create and implement register
    BotToast.showText(text: 'Showing Register Form');
  }
}
