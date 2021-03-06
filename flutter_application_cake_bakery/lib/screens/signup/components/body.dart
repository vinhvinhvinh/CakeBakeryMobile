import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/button.dart';
import 'package:flutter_application_cake_bakery/components/logo.dart';
import 'package:flutter_application_cake_bakery/components/textfield.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
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
  bool isCheckedConfirm = true;

  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();
  final address1Controller = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            const Logo(),
            TextFieldCake(
              obs: false,
              text: 'Email ...',
              textTypeInput: TextInputType.emailAddress,
              textController: emailController,
              preIcon: Icons.email,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: false,
              text: 'T??n ????ng nh???p',
              textTypeInput: TextInputType.text,
              textController: usernameController,
              preIcon: Icons.person_outline,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: isChecked,
              text: 'M???t kh???u',
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
              text: 'X??c nh???n m???t kh???u',
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
            TextFieldCake(
              obs: false,
              text: 'T??n',
              textTypeInput: TextInputType.text,
              textController: fullnameController,
              preIcon: Icons.assignment_ind,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: false,
              text: '?????a ch???',
              textTypeInput: TextInputType.text,
              textController: address1Controller,
              preIcon: Icons.home,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldCake(
              obs: false,
              text: '??i???n tho???i',
              textTypeInput: TextInputType.text,
              textController: phoneController,
              preIcon: Icons.phone,
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
                  press: () async {
                    if (usernameController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        confirmpassController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        fullnameController.text.isNotEmpty &&
                        address1Controller.text.isNotEmpty &&
                        phoneController.text.isNotEmpty) {
                      if (passwordController.text ==
                          confirmpassController.text) {
                        userPrvd
                            .register(
                                emailController.text,
                                usernameController.text,
                                passwordController.text,
                                fullnameController.text,
                                address1Controller.text,
                                phoneController.text)
                            .then((user) => {
                                  if (user != null)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text("????ng k?? th??nh c??ng"))),
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          "/main_screen", (route) => false),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  '????ng k?? th???t b???i, vui l??ng th??? l???i'))),
                                    }
                                });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("M???t kh???u kh??ng tr??ng kh???p")));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Vui l??ng ??i???n ?????y ????? th??ng tin")));
                    }
                  },
                ),
                Button(
                    text: 'Login',
                    backgroundColor: yellowColor,
                    press: () {
                      Navigator.pushNamed(context, '/login');
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
