import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];

  bool loading = false;
  getAll(context) async{
    loading=true;
    products=await getAllProducts(context);
    loading=false;
    notifyListeners();
  }

  bestSelling(context) async {
    loading = true;

    products = await getbestSelling(context);
    loading = false;
    notifyListeners();
  }

  getNewProduct(context) async {
    loading = true;

    products = await getAllNewProduct(context);
    loading = false;
    notifyListeners();
  }
  getProductByType(context, type) async{
      loading=true;
      products=await getProductsByType(context, type);
      loading=false;
      notifyListeners();
    }

}
