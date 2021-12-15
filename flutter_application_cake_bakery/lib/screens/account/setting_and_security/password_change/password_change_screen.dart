import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/header.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

import 'components/body.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: Header(
            title: 'Change Your Password',
            backgrColor: primaryColor,
            textColor: Colors.white,
            action: null),
      ),
      body: Body(),
    );
  }
}
