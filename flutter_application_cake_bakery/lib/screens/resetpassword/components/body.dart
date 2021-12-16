import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/button.dart';
import 'package:flutter_application_cake_bakery/components/logo.dart';
import 'package:flutter_application_cake_bakery/components/textfield.dart';

import '../../../constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_backgr.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            const Logo(),
            TextFieldCake(
              obs: false,
              textController: password,
              text: 'Password ...',
              preIcon: Icons.vpn_key,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: false,
              textController: password,
              text: 'Confirm Password ...',
              preIcon: Icons.vpn_key,
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
                text: 'Reset Your Password',
                backgroundColor: yellowColor,
                press: () {})
          ],
        ),
      ),
    );
  }
}
