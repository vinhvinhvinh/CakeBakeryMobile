import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:flutter_application_cake_bakery/screens/cart/checkout/checkout_screen.dart';
import 'package:flutter_application_cake_bakery/screens/cart/provider/cart_provider.dart';
import 'package:flutter_application_cake_bakery/screens/favorite/provider/favorite_provider.dart';
import 'package:flutter_application_cake_bakery/screens/home/provider/product_provider.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/provider/invoice_provider.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/provider/comment_provider.dart';
import 'package:provider/provider.dart';
import 'database/db_helper.dart';
import 'screens/account/provider/account_provider.dart';
import 'screens/account/setting_and_security/password_change/password_change_screen.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/product_detail_screen.dart';
import 'screens/account/setting_and_security/setting_security_screen.dart';
import 'screens/changepassword/change_pasword_screen.dart';
import 'screens/forgetpassword/forget_password_screen.dart';
import 'screens/home/provider/product_type_provider.dart';
import 'screens/resetpassword/reset_password_screen.dart';
import 'screens/signup/sign_up_screen.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/Favorite/favorite_screen.dart';
import 'package:flutter_application_cake_bakery/screens/cart/cart_screen.dart';
import 'package:flutter_application_cake_bakery/screens/listproductsbycategory/list_products_by_catergory_screen.dart';
import 'package:flutter_application_cake_bakery/screens/account/account_creen.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/myorder_screen.dart';
import 'package:flutter_application_cake_bakery/screens/account/profile/my_profile_screen.dart';
import 'package:flutter_application_cake_bakery/screens/login/login_screen.dart';
import 'package:flutter_application_cake_bakery/screens/main/main_screen.dart';

//import 'package:flutter_application_cake_bakery/screens/home/home_screen.dart';

void main() {
  runApp(const CakeBakery());
}

class CakeBakery extends StatelessWidget {
  const CakeBakery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductTypeProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CommentProvider()),
        ChangeNotifierProvider(create: (_) => InvoiceProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cake Bakery',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          //'/': (context) => const LoginScreen(),
          '/': (context) => MainScreen(),
          //'/':(context)=> SignUpScreen(),
          '/main_screen': (context) => MainScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/forget_password': (context) => const ForgetPassword(),
          '/reset': (context) => const ResetPasswordScreen(),
          '/change': (context) => const ChangePassword(),
          'account': (context) => const AccountScreen(),
          'cart': (context) => const Cart(),
          //'/checkout': (context) => CheckoutScreen(),
          'account/myprofile': (context) => const ProfileScreen(),
          'account/myorder': (context) => const MyOrderScreen(),
          'account/setting_and_security': (context) =>
              const SettingAndSecurityScreen(),
          'account/account_and_security/change_password': (context) =>
              const PasswordChangeScreen(),
          // 'products_by_category': (context) => ProductsByCategory(type: ,),
          'favorite_products': (context) => const FavoriteScreen(),
          //'product_detail': (context) => const ProductDetail(),
        },
        initialRoute: '/',
      ),
    );
  }
}
