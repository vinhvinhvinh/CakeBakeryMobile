import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'main.dart';

class WattingReceive extends StatelessWidget {
  const WattingReceive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Product(
            text: 'Hàng sẽ được giao tới trong :',
            time: 'h:m:s',
            image: '3.png',
            productname: 'CUPCAKE',
            price: '30000',
            totalPrice: '1'
        ),
        SizedBox(height: kDefaultPadding/2),
        Product(
            text: 'Hàng sẽ được giao tới trong :',
            time: 'h:m:s',
            image: '3.png',
            productname: 'CUPCAKE',
            price: '30000',
            totalPrice: '1'
        ),
        
      ],
    );
  }
}