import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'main.dart';

class Delivered extends StatelessWidget {
  const Delivered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Product(
            text: 'Đã giao ngày :',
            time: 'dd/mm/yyyy',
            image: '3.png',
            productname: 'CUPCAKE',
            price: '30000',
            totalPrice: '1'
        ),
        SizedBox(height: kDefaultPadding/2),
        Product(
            text: 'Đã giao ngày :',
            time: 'dd/mm/yyyy',
            image: '3.png',
            productname: 'CUPCAKE',
            price: '30000',
            totalPrice: '1'
        ),
      ],
    );
  }
}