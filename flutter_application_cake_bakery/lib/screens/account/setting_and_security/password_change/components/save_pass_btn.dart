import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class SaveNewPassButton extends StatefulWidget {
  const SaveNewPassButton({Key? key}) : super(key: key);

  @override
  _SaveNewPassButtonState createState() => _SaveNewPassButtonState();
}

class _SaveNewPassButtonState extends State<SaveNewPassButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 60, right: 60, top: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(btnColor),
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
        ),
        child: Text(
          'Save your changes',
          style: myStyle(17, Colors.white, FontWeight.bold),
        ),
        onPressed: () {
          print('Save New Password');
          Navigator.pop(context);
        },
      ),
    );
  }
}
