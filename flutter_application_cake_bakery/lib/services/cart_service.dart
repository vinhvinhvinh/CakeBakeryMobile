import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/cart.dart';
import 'package:flutter_application_cake_bakery/models/invoice.dart';
import 'package:http/http.dart' as http;

Future deleteCartRow(context, int cartId) async {
  try {
    final response = await http.delete(
      Uri.parse(deleteCartRowUrl + '$cartId'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      print(item);
    }
  } catch (e) {
    rethrow;
  }
  //print(products);
}

Future updateCartQty(context, int cartId, String qty) async {
  try {
    final response = await http.put(Uri.parse(updateCartQtyUrl + '$cartId'),
        body: ({
          "Quantity": qty,
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

Future pay(context, int userId, lineItem) async {
  List<Invoice> lstC = [];
  try {
    final response = await http.post(Uri.parse(payUrl),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
        body: json.encode({
          "userId": userId,
          "lineItem": lineItem,
        }));

    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      print(item['message']);

      //lstC = (json.decode(item['data']) as List)
      //.map((prod) => Invoice.fromJson(prod))
      //.toList();
      //var ivId = lstC[0].id;

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text("Chúc mừng! Thanh toán thành công"),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/", (route) => false);
                    },
                  ),
                ],
              ));
    }
  } catch (e) {
    rethrow;
  }
}
