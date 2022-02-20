import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/cart.dart';
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
    print(cartId.runtimeType);
    print(qty.runtimeType);
    final response = await http.put(Uri.parse(updateCartQtyUrl + '$cartId'),
        body: ({
          "Quantity": qty,
        }));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      print(item);
    }
  } catch (e) {
    rethrow;
  }
  //print(products);
}
