import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/services/product_service.dart';

//San pham provider
class CartProvider extends ChangeNotifier {
  List<Product> productsInCart = [];

  bool loading = false;
  getProductInCart(context, accountId) async {
    loading = true;
    productsInCart = await getAllProductInCart(context, accountId);
    loading = false;
    notifyListeners();
  }
}
