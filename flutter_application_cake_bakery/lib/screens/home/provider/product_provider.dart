import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/product.dart';


class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  bool loading = false;

  bestSelling(context) async {
    loading = true;

    products = await bestSelling(context);
    loading = false;
    notifyListeners();
  }
}
