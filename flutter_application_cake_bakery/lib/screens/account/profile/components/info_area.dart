// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class InfomationArea extends StatefulWidget {
  const InfomationArea({Key? key}) : super(key: key);

  @override
  State<InfomationArea> createState() => _InfomationAreaState();
}

class _InfomationAreaState extends State<InfomationArea> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController1 = TextEditingController();
  var addressController2 = TextEditingController();

  @override
  void dispose() {
    //Cleanup
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController1.dispose();
    addressController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name:'),
          userInfoTextField(usernameController, 'Nguyen The Vinh',
              TextCapitalization.words, 50, 1, TextInputType.text),
          Text('Email:'),
          userInfoTextField(emailController, 'codemetlam@gmail.com',
              TextCapitalization.none, 100, 1, TextInputType.emailAddress),
          Text('Phone:'),
          userInfoTextField(phoneController, '0123456789',
              TextCapitalization.none, 10, 1, TextInputType.phone),
          Text('Address 1:'),
          userInfoTextField(addressController1, '123 Main Street, New York',
              TextCapitalization.none, 200, 2, TextInputType.text),
          Text('Address 2:'),
          userInfoTextField(addressController2, '123 Main Street, New York',
              TextCapitalization.none, 200, 2, TextInputType.text),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(btnColor),
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
            ),
            child: Text('Save Changed'),
            onPressed: () {
              print('Save Changed');
            },
          ),
        ],
      ),
    );
  }

  TextField userInfoTextField(
      TextEditingController txtController,
      String fieldHint,
      TextCapitalization txtCapitalization,
      int fieldLength,
      int fieldLine,
      TextInputType keyboardType) {
    return TextField(
      controller: txtController,
      maxLength: fieldLength,
      maxLines: fieldLine, //can't null
      textCapitalization: txtCapitalization,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: fieldHint,
        suffixIcon: Icon(Icons.create),
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
