import 'package:flutter/material.dart';

class UserPasswordField extends StatelessWidget {
  String fieldHint;
  IconData preIcon;
  IconData suffIcon;
  TextInputType keyboardType;
  TextEditingController txtController;
  bool isHide;
  Function()? press;
  UserPasswordField(
      {Key? key,
      required this.fieldHint,
      required this.preIcon,
      required this.suffIcon,
      required this.keyboardType,
      required this.txtController,
      required this.isHide,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHide,
      controller: txtController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: fieldHint,
        prefixIcon: Icon(preIcon),
        suffixIcon: InkWell(
          onTap: press,
          child: Icon(suffIcon),
        ),
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
