import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/services/product_service.dart';
import 'package:flutter_application_cake_bakery/models/cart.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

//San pham provider
class CartProvider extends ChangeNotifier {
  var total = 0;
  List<Cart> productsInCart = [];

  bool loading = false;
  getProductInCart(context, accountId) async {
    loading = true;
    productsInCart = await getAllProductInCart(context, accountId);
    loading = false;

    notifyListeners();
  }

  getTotalInCart() {
    loading = true;
    total = 0;
    for (int i = 0; i < productsInCart.length; i++) {
      total += (productsInCart[i].price * productsInCart[i].quantity);
    }
    loading = false;
    //notifyListeners();
  }

  deleteCartRow(int cartId) async {
    loading = true;

    try {
      final response = await http.delete(
        Uri.parse(deleteCartRowUrl + '$cartId'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        //print(products);
      }
    } catch (e) {
      rethrow;
    }

    loading = false;
    notifyListeners();
  }
}
