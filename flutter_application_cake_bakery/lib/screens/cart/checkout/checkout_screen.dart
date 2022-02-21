import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/header.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/cart.dart';
import 'package:flutter_application_cake_bakery/screens/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class CheckoutScreen extends StatefulWidget {
  final int total;
  const CheckoutScreen({Key? key, required this.total}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: Header(
            title: '',
            backgrColor: primaryColor,
            textColor: Colors.white,
            action: null),
        preferredSize: Size(double.infinity, 50),
      ),
      body: Body(
        total: widget.total,
      ),
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
  final usser = DBHelper.instance.userr;

  @override
  Widget build(BuildContext context) {
    List<Cart> lstCart =
        Provider.of<CartProvider>(context, listen: false).productsInCart;
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
                      print('PURCHASE');
                      Provider.of<CartProvider>(context, listen: false)
                          .callPay(context, usser.id, lstCart, "", "");
                    },
                    child: Text('THANH TOÁN',
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
