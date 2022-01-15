import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/product_type.dart';
import 'package:http/http.dart' as http;

Future<List<ProductType>> getAllProductType(context) async {
  List<ProductType> productTypes = [];

  try {
    final response = await http.get(
      Uri.parse(productTypeUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      //print(item);
      productTypes =
          (item as List).map((pt) => ProductType.fromJson(pt)).toList();
    }
  } catch (e) {
    rethrow;
  }

  return productTypes;
}
