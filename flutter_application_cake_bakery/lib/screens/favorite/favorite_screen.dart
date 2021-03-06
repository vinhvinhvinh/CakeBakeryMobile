import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/favorite/components/body_favorite.dart';

import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

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
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Container(
        height: 65,
        //padding: const EdgeInsets.only(left: 80,top:20),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: const Center(
          child: Text(
            'Danh sách yêu thích',
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/svg/icons/cart.svg",
            // By default our  icon color is white
            color: ktextColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'cart');
          },
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
