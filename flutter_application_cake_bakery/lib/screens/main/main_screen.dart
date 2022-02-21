import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/account_creen.dart';
import 'package:flutter_application_cake_bakery/screens/cart/cart_screen.dart';
import 'package:flutter_application_cake_bakery/screens/favorite/favorite_screen.dart';
import 'package:flutter_application_cake_bakery/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> defaultPages = <Widget>[
    const HomeScreen(),
    const Cart(),
    const FavoriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: defaultPages[pageIndex],
      ),
      bottomNavigationBar: navigationBar(),
    );
  }

  Widget navigationBar() {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(
        color: btnColor,
      ),
      showUnselectedLabels: false,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      iconSize: 30,
      onTap: (pageValue) {
        setState(() {
          pageIndex = pageValue;
        });
      },
      currentIndex: pageIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: 'Trang chủ'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined), label: 'Giỏ hàng'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Yêu thích'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Tài khoản'),
      ],
    );
  }
}
