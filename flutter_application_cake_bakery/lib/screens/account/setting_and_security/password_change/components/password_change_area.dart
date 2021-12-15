import 'package:flutter/material.dart';

class PasswordChangeArea extends StatefulWidget {
  PasswordChangeArea({Key? key}) : super(key: key);

  @override
  _PasswordChangeAreaState createState() => _PasswordChangeAreaState();
}

class _PasswordChangeAreaState extends State<PasswordChangeArea> {
  var recentPassword = TextEditingController();
  var newPassword = TextEditingController();
  var confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Password:'),
          userInfoTextField(recentPassword, '', TextInputType.text, true,
              Icons.password_outlined),
          const SizedBox(height: 25),
          const Text('New Password:'),
          userInfoTextField(newPassword, '', TextInputType.text, true,
              Icons.password_outlined),
          const SizedBox(height: 25),
          const Text('Confirm Password:'),
          userInfoTextField(
              confirmPassword, '', TextInputType.text, true, Icons.check_sharp),
        ],
      ),
    );
  }

  TextField userInfoTextField(
      TextEditingController txtController,
      String fieldHint,
      TextInputType keyboardType,
      bool isPassword,
      IconData icon) {
    return TextField(
      obscureText: isPassword,
      controller: txtController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: fieldHint,
        suffixIcon: Icon(icon),
      ),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }
}
