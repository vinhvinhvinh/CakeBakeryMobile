import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getbestSelling(context) async {
  List<Product> products = [];

  try {
    final response = await http.get(
      Uri.parse(productSellingUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      print(item);
      products = (item as List).map((prod) => Product.fromJson(prod)).toList();
    }
  } catch (e) {
    rethrow;
  }

  return products;
}
