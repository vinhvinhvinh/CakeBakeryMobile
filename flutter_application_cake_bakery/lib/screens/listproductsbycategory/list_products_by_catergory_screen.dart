import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/favorite/favorite_screen.dart';
import 'package:flutter_application_cake_bakery/screens/listproductsbycategory/components/body_list_products_by_category.dart';


class ProductsByCategory extends StatelessWidget {
  const ProductsByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context), body: Body());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 24,
          color: Colors.white,
        ),
        onPressed: () =>Navigator.pop(context),
      ),
      title: Container(
        height: 65,
        //padding: const EdgeInsets.only(left: 80, top: 20),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
          child: Text(
            'PRODUCT TYPE NAME',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
          onPressed: () =>Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoriteScreen(),
              ),
            ),
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
