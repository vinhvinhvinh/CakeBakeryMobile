import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/body.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
    //);
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text('My order'.toUpperCase()),
      centerTitle: true,
    );
  }
}
