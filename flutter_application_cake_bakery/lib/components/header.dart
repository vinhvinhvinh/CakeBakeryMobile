import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    required this.backgrColor,
    required this.textColor,
    required this.action,
  }) : super(key: key);

  final String title;
  final Color backgrColor;
  final Color textColor;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.navigate_before_outlined, color: textColor, size: 30),
      ),
      title: Text(
        title,
        style: myStyle(22, textColor, FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      actions: action,
      backgroundColor: backgrColor,
    );
  }
}
