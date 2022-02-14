import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/product.dart';
import 'package:flutter_application_cake_bakery/services/product_service.dart';

//San pham provider
class ProductProvider extends ChangeNotifier {
  List<Product> bestSellingproducts = [];
  List<Product> newProducts = [];
  List<Product> products = [];

  bool loading = false;

  bestSelling(context) async {
    loading = true;

    bestSellingproducts = await getbestSelling(context);
    loading = false;
    notifyListeners();
  }

  getNewProduct(context) async {
    loading = true;

    newProducts = await getAllNewProduct(context);
    loading = false;
    notifyListeners();
  }
}
