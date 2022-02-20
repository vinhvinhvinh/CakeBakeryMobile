import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/comment.dart';
import 'package:http/http.dart' as http;

//Product By ProductType
Future<List<Comment>> getCommentByProductId(context, productId) async {
  List<Comment> comments = [];

  try {
    final response = await http.get(
      Uri.parse(cmtUrl + '/$productId'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
print(item);
      comments = (item as List).map((prod) => Comment.fromJson(prod)).toList();
    }
  } catch (e) {
    rethrow;
  }
  //print(products);
  return comments;
}
