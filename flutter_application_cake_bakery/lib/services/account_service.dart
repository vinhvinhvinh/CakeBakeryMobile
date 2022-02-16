// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter_application_cake_bakery/base_url.dart';
// import 'package:flutter_application_cake_bakery/models/account.dart';
// import 'package:http/http.dart' as http;

// Future<Account> getAccountDetail(context) async {
//   Account acc = Account(
//       id: '',
//       username: '',
//       password: '',
//       email: '',
//       fullname: '',
//       address1: '',
//       phone: '',
//       isAdmin: 0,
//       status: 1);

//   try {
//     final response = await http.get(
//       Uri.parse(accountUrl),
//       headers: {
//         HttpHeaders.contentTypeHeader: "application/json",
//       },
//     );
//     if (response.statusCode == 200) {
//       final item = json.decode(response.body);
//       acc = Account.fromJson(item);
//     }
//   } catch (e) {
//     rethrow;
//   }

//   return acc;
// }
