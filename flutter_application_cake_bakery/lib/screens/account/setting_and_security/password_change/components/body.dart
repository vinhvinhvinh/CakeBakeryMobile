import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/screens/account/setting_and_security/password_change/components/password_change_area.dart';
import 'package:flutter_application_cake_bakery/screens/account/setting_and_security/password_change/components/save_pass_btn.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PasswordChangeArea(),
        const SaveNewPassButton(),
      ],
    );
  }
}
