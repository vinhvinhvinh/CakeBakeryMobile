import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/screens/home/provider/product_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'components/body_product_detail.dart';

class ProductDetail extends StatefulWidget {
  final Product detail;
  const ProductDetail({ Key? key, required this.detail}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // @override
  // void initState(){
  //   super.initState();
  //   final product=Provider.of<ProductProvider>(context, listen: false);
  //   product.getAll(context);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context), body: Body(detail: widget.detail));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/svg/icons/back.svg"),
        onPressed: () =>Navigator.pop(context),
      ),
      title: Container(
        height: 65,
        //padding: const EdgeInsets.only(left: 80, top: 20),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Center(
          child: Text(
          widget.detail.name,
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