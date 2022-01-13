
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application_cake_bakery/models/Products.dart';

class NetworkRequest{
  static const String url='http://10.0.2.2:8000/api/products';

  static List<Products> parseProducts(String responseBody)
  {
    var list=json.decode(responseBody) as List<dynamic>;
    List<Products> pro=list.map((model) => Products.fromJson(model)).toList();
    return pro;
  }
  static Future<List<Products>> fetchProducts() async{
    final response =await http.get(Uri.parse(url));
    if(response.statusCode==200)
    {
      return compute(parseProducts,response.body);
    }
    else if(response.statusCode==404)
    {
        throw Exception('Not found');
    }
    else {
      throw Exception('can\'t get products');
    }
  }
}