import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/cart/components/cart_card_item.dart';

class CartMain extends StatefulWidget {
  const CartMain({Key? key}) : super(key: key);

  @override
  _CartMainState createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  final userr = DBHelper.instance.userr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(userr.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartCardItem(
          productName: 'Vero Flancer Smooth',
          productTypeName: 'Cup cake',
          productImage: 'arivals-2.jpg',
          productPrice: 32400,
          productQuantity: 1,
        ),
        CartCardItem(
          productName: 'Vero Flancer Smooth',
          productTypeName: 'Cup cake',
          productImage: 'arivals-2.jpg',
          productPrice: 32400,
          productQuantity: 1,
        ),
        CartCardItem(
          productName: 'Vero Flancer Smooth',
          productTypeName: 'Cup cake',
          productImage: 'arivals-2.jpg',
          productPrice: 32400,
          productQuantity: 1,
        ),
      ],
    );
  }
}
