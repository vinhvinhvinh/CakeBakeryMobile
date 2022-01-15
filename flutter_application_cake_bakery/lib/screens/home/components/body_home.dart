//import 'package:doan/screens/home/components/top_products_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/screens/home/components/banner_home.dart';
import 'package:flutter_application_cake_bakery/screens/home/components/search_bar_home.dart';

import 'list_categories_home.dart';
import 'list_new_products_home.dart';
import 'list_products_best_selling.dart';
import 'top_products_home.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      SearchBarHome(),
      //Banner
      Banners(),
      ListCategories(),
      BestSellingProduct(),
      NewProducts(),
      //TopProducts(),
      //NavigationBar(),
      //BloC, GetX, Provider
    ]);
  }
}
