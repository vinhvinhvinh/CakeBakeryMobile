import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/button.dart';
import 'package:flutter_application_cake_bakery/components/logo.dart';
import 'package:flutter_application_cake_bakery/components/textfield.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //bool isChecked = true;
  //bool isCheckedConfirm = true;
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final recentPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            const Logo(),
            TextFieldCake(
              obs: false,
              text: 'Recent Password ...',
              textController: recentPassController,
              preIcon: Icons.vpn_key,
              press: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: false,
              text: 'New Password ...',
              textController: passwordController,
              preIcon: Icons.vpn_key,
              //subIcon: isChecked ? Icons.visibility_off : Icons.visibility,
              press: () {
                setState(() {
                  //isChecked = !isChecked;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: false,
              text: 'Confirm Password ...',
              textController: confirmpassController,
              preIcon: Icons.done,
              //subIcon:
              //isCheckedConfirm ? Icons.visibility_off : Icons.visibility,
              press: () {
                setState(() {
                  //isCheckedConfirm = !isCheckedConfirm;
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
                    text: 'Login',
                    backgroundColor: yellowColor,
                    press: () {
                      Navigator.pushNamed(context, '/');
                    }),
                Button(
                    text: 'Sign up', backgroundColor: yellowColor, press: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
