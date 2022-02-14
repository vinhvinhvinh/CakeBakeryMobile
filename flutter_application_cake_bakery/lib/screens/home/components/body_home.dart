//import 'package:doan/screens/home/components/top_products_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/home/components/banner_home.dart';
import 'package:flutter_application_cake_bakery/screens/home/components/search_bar_home.dart';

import 'list_categories_home.dart';
import 'list_new_products_home.dart';
import 'list_products_best_selling.dart';
import 'top_products_home.dart';

UserDB user = UserDB(
    id: 0,
    username: "",
    password: "",
    email: "",
    fullname: "",
    address1: "",
    phone: "",
    otp: "",
    userToken: "",
    status: 0);

Future getUser() async {
  user = await DBHelper.instance.getUser();

  print('hhhhhhh : ${user.userToken}');
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //getUser();
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
