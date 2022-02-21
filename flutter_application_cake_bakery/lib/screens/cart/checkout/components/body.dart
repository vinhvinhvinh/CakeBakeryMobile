import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

import 'checkout_info.dart';
import 'top_checkout.dart';

class Body extends StatefulWidget {
  final int total;
  const Body({Key? key, required this.total}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TopCheckout(
          total: widget.total,
        ),
        CheckoutInfo(),
      ],
    );
  }
}
