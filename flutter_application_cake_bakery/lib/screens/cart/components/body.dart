import 'package:flutter/material.dart';

import 'cart_main.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          yourCart(),
          CartMain(),
        ],
      ),
    );
  }

  Container yourCart() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      child: const Text(
        'Your Cart',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
      ),
    );
  }
}
