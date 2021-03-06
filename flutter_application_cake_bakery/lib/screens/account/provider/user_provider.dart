import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/services/account_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  //Test sqflite
  DBHelper dbHelper = DBHelper.instance;
  //tạo tạm user để hiện dữ liệu
  UserDB? _user;
  //tạo 1 user để lưu user đã login
  late Future<UserDB> userLogined;

//tạo 1 user để lưu user đã dang ky
  late Future<UserDB> userResigter;
//tạo 1 user để lưu user đã cập nhật
  late Future<UserDB> userUpdate;
  //get user
  UserDB? get user => _user;
  //get user Logined
bool loading = false;
updateProfile(context, id, username, fullname, address1, address2, email, phone) async {
    loading = true;
    await update(context, id, username, fullname, address1, address2, email, phone);
    loading = false;
    notifyListeners();
}
  Future<UserDB?> login(String username, String password) async {
    var response = await http.post(Uri.parse(loginUrl),
        body: ({
          "Username": username,
          "Password": password,
        }));

    if (response.statusCode == 200) {
      var userLogined = UserToken.fromJson(json.decode(response.body));

      print('Đang đăng nhập');
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
          .then((value) => print('Thêm thành công'))
          .onError((error, stackTrace) =>
              print('Thêm thất bại, Lỗi:' + error.toString()));

      //Tạo một user để vừa lưu cho Provider vừa để trả về
      UserDB userPackage = UserDB(
        id: userLogined.user!.id,
        username: userLogined.user!.username,
        password: userLogined.user!.password,
        email: userLogined.user!.email,
        fullname: userLogined.user!.fullname,
        address1: userLogined.user!.address1,
        address2: userLogined.user?.address2,
        phone: userLogined.user!.phone,
        avatar: userLogined.user!.avatar,
        otp: "",
        userToken: userLogined.userToken,
        status: userLogined.user!.status,
      );
      _user = userPackage;
      return userPackage;
    }
  }

  Future<UserDB?> register(String email, String username, String password,
      String fullname, String address, String phone) async {
    var response = await http.post(Uri.parse(registerUrl),
        body: ({
          "Username": username,
          "Password": password,
          "Email": email,
          "Fullname": fullname,
          "Address1": address,
          "Phone": phone,
        }));

    print(response.statusCode);

    if (response.statusCode == 201) {
      var userResigter = UserToken.fromJson(json.decode(response.body));

      print('Đang đăng ký');

      dbHelper
          .insertUser(
            UserDB(
              id: userResigter.user!.id,
              username: userResigter.user!.username,
              password: userResigter.user!.password,
              email: userResigter.user!.email,
              fullname: userResigter.user!.fullname,
              address1: userResigter.user!.address1,
              address2: userResigter.user!.address2,
              phone: userResigter.user!.phone,
              avatar: userResigter.user!.avatar,
              otp: "",
              userToken: userResigter.userToken,
              status: userResigter.user!.status,
            ),
          )
          .then((value) => print('Đăng ký->thêm thành công'))
          .onError((error, stackTrace) =>
              print('Thêm thất bại, Lỗi:' + error.toString()));

      UserDB userPackage = UserDB(
        id: userResigter.user!.id,
        username: userResigter.user!.username,
        password: userResigter.user!.password,
        email: userResigter.user!.email,
        fullname: userResigter.user!.fullname,
        address1: userResigter.user!.address1,
        address2: userResigter.user?.address2,
        phone: userResigter.user!.phone,
        avatar: userResigter.user!.avatar,
        otp: "",
        userToken: userResigter.userToken,
        status: userResigter.user!.status,
      );

      return userPackage;
    }
  }

  Future logout(userToken, int id, context) async {
    final response = await http.post(Uri.parse(logoutUrl),
        //Đăng xuất bằng token
        headers: ({'Authorization': 'Bearer' + userToken}));
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Đăng xuất thành công")));
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      // Xóa bảng user khỏi sqflite
      DBHelper.instance.delete(id, 'user');
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Đăng xuất thất bại"),
                content: const Text("Vui lòng thử lại"),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ));
    }
  }

  Future<UserDB> getUserData() async {
    //lấy user sqflite lên trả về UserDB
    userLogined = DBHelper.instance.getUser();
    //print(userLogined);
    return userLogined;
  }
  Future<UserDB?> changePassword(
      context, int id, String recentPassword, String newPassword) async {
    var response = await http.put(Uri.parse(changePassUrl + '$id'),
        body: ({
          "OldPassword": recentPassword,
          "NewPassword": newPassword,
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      DBHelper.instance.delete(id, 'user');
      var userLogined = UserToken.fromJson(json.decode(response.body));

      print('Đang thay đổi thông tin');

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
          .then((value) => print('Cập nhật sqflite thành công'))
          .onError((error, stackTrace) =>
              print('Thêm thất bại, Lỗi:' + error.toString()));

      //Tạo một user để vừa lưu cho Provider vừa để trả về
      UserDB userPackage = UserDB(
        id: userLogined.user!.id,
        username: userLogined.user!.username,
        password: userLogined.user!.password,
        email: userLogined.user!.email,
        fullname: userLogined.user!.fullname,
        address1: userLogined.user!.address1,
        address2: userLogined.user?.address2,
        phone: userLogined.user!.phone,
        avatar: userLogined.user!.avatar,
        otp: "",
        userToken: userLogined.userToken,
        status: userLogined.user!.status,
      );

      return userPackage;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Mật khẩu cũ không đúng")));
    }
  }
}

