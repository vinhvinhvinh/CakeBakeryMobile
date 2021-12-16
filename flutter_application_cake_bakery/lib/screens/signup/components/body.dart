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
  bool isChecked = true;
  bool isCheckedConfirm = true;
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
              text: 'Username ...',
              textTypeInput: TextInputType.emailAddress,
              textController: usernameController,
              preIcon: Icons.email,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: isChecked,
              text: 'Password ...',
              textController: passwordController,
              preIcon: Icons.vpn_key,
              subIcon: isChecked ? Icons.visibility_off : Icons.visibility,
              press: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: isCheckedConfirm,
              text: 'Confirm Password ...',
              textController: confirmpassController,
              preIcon: Icons.vpn_key,
              subIcon:
                  isCheckedConfirm ? Icons.visibility_off : Icons.visibility,
              press: () {
                setState(() {
                  isCheckedConfirm = !isCheckedConfirm;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                    text: 'Sign Up',
                    backgroundColor: yellowColor,
                    press: () {
                      print('SIGN UP');
                    }),
                Button(
                    text: 'Login',
                    backgroundColor: yellowColor,
                    press: () {
                      Navigator.pushNamed(context, '/');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
