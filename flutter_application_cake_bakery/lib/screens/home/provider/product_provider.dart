import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/services/product_service.dart';

//San pham provider
class ProductProvider extends ChangeNotifier {
<<<<<<< HEAD
  
=======
  List<Product> bestSellingproducts = [];
  List<Product> newProducts = [];
>>>>>>> 4f807f0c6124834e4c0a4eae1e61b39d608ff9a5
  List<Product> products = [];
  List<Product> topProducts = [];
  List<Product> byProductTypeId = [];

  bool loading = false;
  getAll(context) async{
    loading=true;
    topProducts=await getAllProducts(context);
    loading=false;
    notifyListeners();
  
  }

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
  getProductByType(context, type) async{
      loading=true;
      byProductTypeId=await getProductsByType(context, type);
      loading=false;
      notifyListeners();
    }

}
