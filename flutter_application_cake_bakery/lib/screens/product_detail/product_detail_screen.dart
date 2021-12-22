import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body_product_detail.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: const Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/svg/icons/back.svg"),
        onPressed: () {},
      ),
      title: Container(
        height: 65,
        //padding: const EdgeInsets.only(left: 80, top: 20),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
          child: Text(
            'PRODUCT NAME',
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
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}