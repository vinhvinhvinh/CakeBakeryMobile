import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/favorite.dart';
import 'package:http/http.dart' as http;

Future<List<Favorite>> getFavByAccountId(context, accountId) async {
  List<Favorite> favorites = [];

  try {
    final response = await http.get(
      Uri.parse(favUrl + '/$accountId'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
print(item);
      favorites = (item as List).map((prod) => Favorite.fromJson(prod)).toList();
    }
  } catch (e) {
    rethrow;
  }
  //print(products);
  return favorites;
}

Future deleteFavorite(context, int favId) async {
  try {
    final response = await http.delete(
      Uri.parse(favUrl + '/delete/$favId'),
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