import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:flutter_application_cake_bakery/screens/account/setting_and_security/password_change/components/password_change_area.dart';
import 'package:flutter_application_cake_bakery/screens/account/setting_and_security/password_change/components/save_pass_btn.dart';
import 'package:flutter_application_cake_bakery/screens/account/setting_and_security/password_change/components/user_password_field.dart';
import 'package:provider/provider.dart';

import '../../../../../constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var recentPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();

  var hidePassword_old = true;
  var hidePassword_new = true;
  var hidePassword_confirm = true;

  @override
  Widget build(BuildContext context) {
    final usser = DBHelper.instance.userr;
    final userPrvd = Provider.of<UserProvider>(context, listen: false);

    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mật khẩu cũ:'),
              UserPasswordField(
                  fieldHint: '',
                  preIcon: Icons.edit_outlined,
                  suffIcon: hidePassword_old
                      ? Icons.visibility_off
                      : Icons.visibility,
                  keyboardType: TextInputType.text,
                  txtController: recentPassword,
                  isHide: hidePassword_old,
                  press: () {
                    setState(() {
                      hidePassword_old = !hidePassword_old;
                    });
                  }),
              const SizedBox(height: 25),
              const Text('Mật khẩu mới:'),
              UserPasswordField(
                  fieldHint: '',
                  preIcon: Icons.vpn_key,
                  suffIcon: hidePassword_new
                      ? Icons.visibility_off
                      : Icons.visibility,
                  keyboardType: TextInputType.text,
                  txtController: newPassword,
                  isHide: hidePassword_new,
                  press: () {
                    setState(() {
                      hidePassword_new = !hidePassword_new;
                    });
                  }),
              const SizedBox(height: 25),
              const Text('Xác nhật mật khẩu:'),
              UserPasswordField(
                  fieldHint: '',
                  preIcon: Icons.check,
                  suffIcon: hidePassword_confirm
                      ? Icons.visibility_off
                      : Icons.visibility,
                  keyboardType: TextInputType.text,
                  txtController: confirmPassword,
                  isHide: hidePassword_confirm,
                  press: () {
                    setState(() {
                      hidePassword_confirm = !hidePassword_confirm;
                    });
                  }),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 60, right: 60, top: 20),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btnColor),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(20)),
            ),
            child: Text(
              'Lưu thay đổi',
              style: myStyle(17, Colors.white, FontWeight.bold),
            ),
            onPressed: () async {
              print('Save New Password');
              if (recentPassword.text.isNotEmpty &&
                  newPassword.text.isNotEmpty &&
                  confirmPassword.text.isNotEmpty) {
                if (newPassword.text == confirmPassword.text) {
                  userPrvd
                      .changePassword(context, usser.id, recentPassword.text,
                          newPassword.text)
                      .then((user) => {
                            if (user != null)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Cập nhật thành công"))),
                                Navigator.pop(context),
                                //Navigator.pushNamed(context, '/main_screen');
                              }
                          });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Mật mới và mật khẩu xác nhận không khớp")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Vui lòng điền đầy đủ thông tin")));
              }
            },
          ),
        ),
      ],
    );
  }
}
