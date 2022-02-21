import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/screens/account/setting_and_security/password_change/components/user_password_field.dart';

class PasswordChangeArea extends StatefulWidget {
  PasswordChangeArea({Key? key}) : super(key: key);

  @override
  _PasswordChangeAreaState createState() => _PasswordChangeAreaState();
}

class _PasswordChangeAreaState extends State<PasswordChangeArea> {
  var recentPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();

  var hidePassword_old = true;
  var hidePassword_new = true;
  var hidePassword_confirm = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Old Password:'),
          UserPasswordField(
              fieldHint: '',
              preIcon: Icons.edit_outlined,
              suffIcon:
                  hidePassword_old ? Icons.visibility_off : Icons.visibility,
              keyboardType: TextInputType.text,
              txtController: recentPassword,
              isHide: hidePassword_old,
              press: () {
                setState(() {
                  hidePassword_old = !hidePassword_old;
                });
              }),
          const SizedBox(height: 25),
          const Text('New Password:'),
          UserPasswordField(
              fieldHint: '',
              preIcon: Icons.vpn_key,
              suffIcon:
                  hidePassword_new ? Icons.visibility_off : Icons.visibility,
              keyboardType: TextInputType.text,
              txtController: newPassword,
              isHide: hidePassword_new,
              press: () {
                setState(() {
                  hidePassword_new = !hidePassword_new;
                });
              }),
          const SizedBox(height: 25),
          const Text('Confirm Password:'),
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
    );
  }
}


//file này không còn sử dụng, chia layout quá chi tiết không hợp lý -> đã chuyển qua body