import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

import 'checkout_info.dart';
import 'top_checkout.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const TopCheckout(),
        CheckoutInfo(),
      ],
    );
  }
}
