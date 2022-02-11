import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';

import 'package:http/http.dart' as http;

class AccountProvider with ChangeNotifier {
  //Test sqflite
  DBHelper dbHelper = DBHelper.instance;

  User? _user;
  User? get user => _user;
  Future<User?> login(String username, String password) async {
    var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"),
        body: ({
          "Username": username,
          "Password": password,
        }));

    if (response.statusCode == 200) {
      var userLogined = UserToken.fromJson(json.decode(response.body));
      print('ddang dang nhap');
      dbHelper
          .insertUser(
            UserDB(
              id: userLogined.user!.id,
              username: userLogined.user!.username,
              password: userLogined.user!.password,
              email: userLogined.user!.email,
              fullname: userLogined.user!.fullname,
              address1: userLogined.user!.address1,
              address2: userLogined.user!.address2,
              phone: userLogined.user!.phone,
              avatar: userLogined.user!.avatar,
              otp: "",
              userToken: userLogined.userToken,
              status: userLogined.user!.status,
            ),
          )
          .then((value) => print('Thanh cong'))
          .onError((error, stackTrace) =>
              print('Theem that bai' + error.toString()));

      //print(userLogined.user!.email);
      _user = userLogined.user;
      return userLogined.user;
    }
  }
}
