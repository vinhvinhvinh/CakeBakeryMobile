import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'main.dart';

class Canceled extends StatelessWidget {
  const Canceled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Product(
            text: 'Lý do hủy :',
            time: 'abcd',
            image: '3.png',
            productname: 'CUPCAKE',
            price: '30000',
            totalPrice: '1'
        ),
        SizedBox(height: kDefaultPadding/2),
        Product(
            text: 'Lý do hủy :',
            time: 'abcde',
            image: '3.png',
            productname: 'CUPCAKE',
            price: '30000',
            totalPrice: '1'
        ),
      ],
    );
  }
}