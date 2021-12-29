import 'package:flutter/material.dart';

import '../../../../constant.dart';

class TopCheckout extends StatefulWidget {
  const TopCheckout({
    Key? key,
  }) : super(key: key);

  @override
  State<TopCheckout> createState() => _TopCheckoutState();
}

class _TopCheckoutState extends State<TopCheckout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            spreadRadius: 10,
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Checkout 💳',
                style: myStyle(20, Colors.black, FontWeight.w400)),
            Text('💸 420.000 VND',
                style: myStyle(18, Colors.orange.shade900, FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
