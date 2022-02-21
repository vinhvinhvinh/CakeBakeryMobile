import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/services/favorite_service.dart';
import 'package:flutter_application_cake_bakery/services/product_service.dart';
import 'package:flutter_application_cake_bakery/models/favorite.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

//San pham provider
class FavoriteProvider extends ChangeNotifier {
  var total = 0;
  List<Favorite> productsFavorite = [];

  bool loading = false;

  getFavoriteByAccount(context, accountId) async{
    loading = true;
    productsFavorite =await getFavByAccountId(context, accountId);
    loading = false;
    notifyListeners();
  }
 
  callDeleteFavorite(context, favId) async {
    loading = true;
    await deleteFavorite(context, favId);
    loading = false;
    notifyListeners();
  }

}
