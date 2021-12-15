import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/header_without_pop.dart';

import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/components/body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50.0),
        child: HeaderWithoutPop(
            title: 'Your Account',
            backgrColor: primaryColor,
            textColor: Colors.white,
            action: null),
      ),
      body: Body(),
    );
  }
}
