import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/product.dart';
import 'package:flutter_application_cake_bakery/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  bool loading = false;

  bestSelling(context) async {
    loading = true;

    products = await getbestSelling(context);
    loading = false;
    notifyListeners();
  }
}
