import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/components/header.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

import 'components/body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        child: Header(
            title: 'CHECKOUT',
            backgrColor: primaryColor,
            textColor: Colors.white,
            action: null),
        preferredSize: Size(double.infinity, 50),
      ),
      body: Body(),
      bottomNavigationBar: CheckOut(),
    );
  }
}

class CheckOut extends StatelessWidget {
  const CheckOut({
    Key? key,
  }) : super(key: key);

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
                    },
                    child: Text('PURCHASE',
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
