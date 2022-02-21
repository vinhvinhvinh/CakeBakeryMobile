import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/services/cart_service.dart';
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

  callDeleteCartRow(context, cartId) async {
    loading = true;
    await deleteCartRow(context, cartId);
    loading = false;
    notifyListeners();
  }

  callUpdateCartQty(context, id, quantity) async {
    loading = true;
    await updateCartQty(context, id, quantity.toString());
    loading = false;
    notifyListeners();
  }

  callPay(context, userId, lineItem) async {
    loading = true;
    await pay(context, userId, lineItem);
    loading = false;
    notifyListeners();
  }
}
