import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class HeaderWithoutPop extends StatelessWidget {
  const HeaderWithoutPop({
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
      automaticallyImplyLeading: false,
      centerTitle: true,
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
