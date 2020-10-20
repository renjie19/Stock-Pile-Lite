import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:stockpilelite/backend/user/user_service.dart';
import 'package:stockpilelite/backend/user_profile/user_profile_user_facade.dart';
import 'package:stockpilelite/shared/constants/app_color.dart';
import 'package:stockpilelite/shared/models/user.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormBuilderState>();
  bool _isNotVisible = true;
  UserProfileUserFacade _facade = GetIt.I<UserProfileUserFacade>();

  InputDecoration _getInputDecoration(String label) {
    return InputDecoration(labelText: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormBuilderTextField(
                    attribute: 'firstName',
                    decoration: _getInputDecoration('First Name *'),
                  ),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                    attribute: 'lastName',
                    decoration: _getInputDecoration('Last Name *'),
                  ),
                  SizedBox(height: 10),
                  FormBuilderDateTimePicker(
                      inputType: InputType.date,
                      attribute: 'birthday',
                      decoration: _getInputDecoration('Birthday *')),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                    attribute: 'username',
                    decoration: _getInputDecoration('Username *'),
                  ),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                    attribute: 'password',
                    obscureText: _isNotVisible,
                    decoration: _getInputDecoration('Password *').copyWith(
                        suffixIcon: InkWell(
                      radius: 10,
                      onTap: () =>
                          setState(() => _isNotVisible = !_isNotVisible),
                      child: Icon(_isNotVisible
                          ? LineAwesomeIcons.eye_slash
                          : LineAwesomeIcons.eye),
                    )),
                  ),
                  SizedBox(height: 25),
                  ButtonBar(
                    children: [
                      MaterialButton(
                          padding: EdgeInsets.all(15),
                          color: AppColor.error,
                          onPressed: _close,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Icon(LineAwesomeIcons.times)),
                      MaterialButton(
                          padding: EdgeInsets.all(15),
                          color: AppColor.primary,
                          onPressed: () => _save(),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Icon(LineAwesomeIcons.check)),
                    ],
                  )
                ],
              ),
            )),
      )),
    );
  }

  void _close() {
    Navigator.pop(context);
  }

  int _getAge(DateTime value) {
    return (DateTime.now().difference(value).inDays / 365).floor();
  }

  void _save() {
    try {
      // open loading
      if (_formKey.currentState.saveAndValidate()) {
        var formValues = _formKey.currentState.value;
        User user = User.instance();
        user.firstName = formValues['firstName'];
        user.lastName = formValues['lastName'];
        user.birthday = formValues['birthday'].millisecondsSinceEpoch;
        user.age = _getAge(formValues['birthday']);
        this._facade.create(user, formValues['username'], formValues['password']);
        BotToast.showSimpleNotification(
            title: 'Success', backgroundColor: Colors.green);
        Navigator.pop(context);
        return;
      }
      BotToast.showSimpleNotification(title: 'Please verify fields', backgroundColor: AppColor.error);
    } catch (e) {
      BotToast.showSimpleNotification(
          title: e.message, backgroundColor: AppColor.error);
    } finally {
      // close loading
    }
  }
}
