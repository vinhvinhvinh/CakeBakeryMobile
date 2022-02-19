import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/cart/components/cart_card_item.dart';
import 'package:flutter_application_cake_bakery/screens/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

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
    //final productsInCart = Provider.of<CartProvider>(context, listen: false);
    //productsInCart.getProductInCart(context, userr.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, state, child) {
      return ListView.builder(
          itemCount: state.productsInCart.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return CartCardItem(
              productName: state.productsInCart[index].name,
              productTypeName: state.productsInCart[index].typeName,
              productImage: state.productsInCart[index].image,
              productPrice: state.productsInCart[index].price,
              productQuantity: state.productsInCart[index].quantity,
            );
          });
    });
  }
}
