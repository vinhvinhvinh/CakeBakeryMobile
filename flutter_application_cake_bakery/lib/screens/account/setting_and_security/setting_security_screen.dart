import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/header.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/components/directional_user.dart';

class SettingAndSecurityScreen extends StatelessWidget {
  const SettingAndSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: Header(
            title: 'Setting and Security',
            backgrColor: primaryColor,
            textColor: Colors.white,
            action: null),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            directionalUserItem('Change Password', Icons.password,
                'account/account_and_security/change_password', ''),
          ],
        ),
      ),
    );
  }
}
