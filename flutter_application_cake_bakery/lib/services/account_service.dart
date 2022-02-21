import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:http/http.dart' as http;


Future update(context, id, String? username, String? fullname, String? email,
      String? address1, String? address2, String? phone) async {
    try {
      final response = await http.put(Uri.parse(userUrl + '/updateByUser/$id'),
          body: ({
            'Username': username,
            'Fullname': fullname,
            'Email': email,
            'Address1': address1,
            'Address2': address2,
            'Phone': phone,
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
      }
    } catch (e) {
      rethrow;
    }
    //print(products);
  }
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
