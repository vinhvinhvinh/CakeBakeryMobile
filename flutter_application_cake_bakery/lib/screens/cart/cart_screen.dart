import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/header_without_pop.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/screens/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final userr = DBHelper.instance.userr;
  @override
  void initState() {
    super.initState();

    final productsInCart = Provider.of<CartProvider>(context, listen: false);
    productsInCart.getProductInCart(context, userr.id);
    productsInCart.getTotalInCart();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        child: HeaderWithoutPop(
            title: '',
            backgrColor: primaryColor,
            textColor: Colors.white,
            action: null),
        preferredSize: Size(double.infinity, 0.0),
      ),
      body: Body(),
      bottomNavigationBar: CheckOut(),
    );
  }
}

class CheckOut extends StatefulWidget {
  const CheckOut({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:',
                    style: myStyle(18, Colors.grey, FontWeight.normal)),
                Text(
                    formatMoney.format(
                        Provider.of<CartProvider>(context, listen: false)
                            .total),
                    style: myStyle(20, Colors.orange, FontWeight.normal)),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFF08F5F)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.only(
                              top: 15, bottom: 15, left: 92, right: 92)),
                    ),
                    onPressed: () {
                      print('READY TO CHECKOUT');
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: Text('Ready to checkout',
                        style: myStyle(20, Colors.white, FontWeight.normal)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
