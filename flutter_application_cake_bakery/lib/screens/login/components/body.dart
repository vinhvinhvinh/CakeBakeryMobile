import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/button.dart';
import 'package:flutter_application_cake_bakery/components/logo.dart';
import 'package:flutter_application_cake_bakery/components/textfield.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DBHelper? dbHelper;

  bool isChecked = true;
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userPrvd = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_backgr.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(30, 25, 30, 0),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forget_password');
                  },
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                    text: 'Sign In',
                    backgroundColor: yellowColor,
                    press: () async {
                      if (usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        userPrvd
                            .login(usernameController.text,
                                passwordController.text)
                            .then((user) => {
                                  if (user != null)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Đăng nhập thành công"))),
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          "/main_screen", (route) => false),
                                      //Navigator.pushNamed(context, '/main_screen');
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Tài khoản hoặc mật khẩu sai'))),
                                    }
                                });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Vui lòng điền đầy đủ thông tin")));
                      }
                    }),
                Button(
                    text: 'Sign Up',
                    backgroundColor: yellowColor,
                    press: () {
                      Navigator.pushNamed(context, '/signup');
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const spinkit = SpinKitRing(color: Colors.red);
