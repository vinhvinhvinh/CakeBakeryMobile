import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/home/home_screen.dart';

void main() {
  runApp(const CakeBakery());
}

class CakeBakery extends StatelessWidget {
  const CakeBakery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cake Bakery',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
      },
      initialRoute: '/',
    );
  }
}
