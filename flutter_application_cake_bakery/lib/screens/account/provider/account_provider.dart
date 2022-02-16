// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_cake_bakery/base_url.dart';
// import 'package:flutter_application_cake_bakery/database/db_helper.dart';
// import 'package:flutter_application_cake_bakery/models/user.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:http/http.dart' as http;

// class AProvider with ChangeNotifier {
//   //Test sqflite
//   DBHelper dbHelper = DBHelper.instance;

//   User? _user;
//   User? get user => _user;
//   Future<User?> login(String username, String password) async {
//     var response = await http.post(Uri.parse(loginUrl),
//         body: ({
//           "Username": username,
//           "Password": password,
//         }));

//     if (response.statusCode == 200) {
//       var userLogined = UserToken.fromJson(json.decode(response.body));

//       print('Đang đăng nhập');
//       dbHelper
//           .insertUser(
//             UserDB(
//               id: userLogined.user!.id,
//               username: userLogined.user!.username,
//               password: userLogined.user!.password,
//               email: userLogined.user!.email,
//               fullname: userLogined.user!.fullname,
//               address1: userLogined.user!.address1,
//               address2: userLogined.user!.address2,
//               phone: userLogined.user!.phone,
//               avatar: userLogined.user!.avatar,
//               otp: "",
//               userToken: userLogined.userToken,
//               status: userLogined.user!.status,
//             ),
//           )
//           .then((value) => print('Thêm thành công'))
//           .onError((error, stackTrace) =>
//               print('Thêm thất bại, Lỗi:' + error.toString()));

//       //print(userLogined.user!.email);
//       _user = userLogined.user;
//       return userLogined.user;
//     }
//   }

//   Future logout(userToken, int id, context) async {
//     final response = await http.post(Uri.parse(logoutUrl),
//         //Đăng xuất bằng token
//         headers: ({'Authorization': 'Bearer' + userToken}));
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Đăng xuất thành công")));
//       Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
//       // Xóa bảng user khỏi sqflite
//       DBHelper.instance.delete(id, 'user');
//     } else {
//       showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 title: const Text("Đăng xuất thất bại"),
//                 content: const Text("Vui lòng thử lại"),
//                 actions: <Widget>[
//                   // usually buttons at the bottom of the dialog
//                   TextButton(
//                     child: const Text("OK"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ));
//     }
//   }
// }
