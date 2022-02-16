// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:provider/provider.dart';

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

  //tạo một user trước
  late UserDB userLogined;

  @override
  Widget build(BuildContext context) {
    final userLogined = Provider.of<UserProvider>(context);

    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder(
          future: userLogined.getUserData(),
          builder: (context, AsyncSnapshot<UserDB> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.id != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name:'),
                    userInfoTextField(
                        usernameController,
                        snapshot.data!.fullname,
                        TextCapitalization.words,
                        50,
                        1,
                        TextInputType.text),
                    Text('Email:'),
                    userInfoTextField(
                        emailController,
                        snapshot.data!.email,
                        TextCapitalization.none,
                        100,
                        1,
                        TextInputType.emailAddress),
                    Text('Phone:'),
                    userInfoTextField(phoneController, snapshot.data!.phone,
                        TextCapitalization.none, 10, 1, TextInputType.phone),
                    Text('Address 1:'),
                    userInfoTextField(
                        addressController1,
                        snapshot.data!.address1,
                        TextCapitalization.none,
                        200,
                        2,
                        TextInputType.text),
                    Text('Address 2:'),
                    userInfoTextField(
                        addressController2,
                        snapshot.data!.address2 ?? '',
                        TextCapitalization.none,
                        200,
                        2,
                        TextInputType.text),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(btnColor),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(20)),
                      ),
                      child: Text('Save Changed'),
                      onPressed: () {
                        print('Save Changed');
                      },
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            }
            return SizedBox();
          }),
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
