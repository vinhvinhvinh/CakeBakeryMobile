import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/product_type.dart';
import 'package:flutter_application_cake_bakery/services/producttype_service.dart';

class ProductTypeProvider extends ChangeNotifier {
  List<ProductType> productTypes = [];

  bool loading = false;

  getProductType(context) async {
    loading = true;

    productTypes = await getAllProductType(context);
    loading = false;
    notifyListeners();
  }
}
