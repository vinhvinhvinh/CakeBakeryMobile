import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:http/http.dart' as http;

Future logout(userToken, int id, context) async {
  final response = await http.post(Uri.parse(logoutUrl),
      headers: ({'Authorization': 'Bearer' + userToken}));
  if (response.statusCode == 200) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Đăng xuất thành công")));
    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
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
