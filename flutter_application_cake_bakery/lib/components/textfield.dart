import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable

class TextFieldCake extends StatelessWidget {
  String? text;
  IconData? preIcon, subIcon;
  TextInputType? textTypeInput;
  bool obs = false;
  Function()? press;
  var textController = TextEditingController();

  TextFieldCake({
    Key? key,
    this.text,
    this.preIcon,
    this.subIcon,
    this.textTypeInput,
    this.press,
    required this.obs,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obs,
      controller: textController,
      keyboardType: textTypeInput,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(preIcon),
        suffixIcon: InkWell(
          onTap: press,
          child: Icon(subIcon),
        ),
        labelText: text,
        labelStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
