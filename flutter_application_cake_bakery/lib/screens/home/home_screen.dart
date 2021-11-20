import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello',
            style: TextStyle(
              color: primaryColor,
              fontSize: 10,
            )),
      ),
      body: Container(
        child: const Text('Hihi'),
      ),
    );
  }
}
