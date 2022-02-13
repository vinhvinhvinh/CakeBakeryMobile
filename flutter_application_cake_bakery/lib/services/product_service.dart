import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/models/product_type.dart';
import 'package:http/http.dart' as http;

//Top product
Future<List<Product>> getAllProducts(context) async{
  List<Product> products = [];

  try {
    final response = await http.get(
      Uri.parse(productUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      
      products = (item as List).map((prod) => Product.fromJson(prod)).toList();
      //print(products);
    }
  } catch (e) {
    rethrow;
  }
  //print(products);
  return products;
}
// Product BestSelling
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
      
      products = (item as List).map((prod) => Product.fromJson(prod)).toList();
      //print(products);
    }
  } catch (e) {
    rethrow;
  }
  //print(products);
  return products;
}

// New product (Order by Date Decs)
Future<List<Product>> getAllNewProduct(context) async {
  List<Product> products = [];

  try {
    final response = await http.get(
      Uri.parse(newProds),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      //print(item);
      products = (item as List).map((prod) => Product.fromJson(prod)).toList();
    }
  } catch (e) {
    rethrow;
  }

  return products;
}

//Product By ProductType
// Future<List<Product>> getProductsByType(context,ProductType type) async{
//   List<Product> products = [];

//   try {
//     final response = await http.get(
//       Uri.parse(productUrl+'/productType/$type'),
//       headers: {
//         HttpHeaders.contentTypeHeader: "application/json",
//       },
//     );
//     if (response.statusCode == 200) {
//       final item = json.decode(response.body);
      
//       products = (item as List).map((prod) => Product.fromJson(prod)).toList();
//       //print(products);
//     }
//   } catch (e) {
//     rethrow;
//   }
//   //print(products);
//   return products;
// }

