import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/account_creen.dart';
import 'package:flutter_application_cake_bakery/screens/account/profile/my_profile_screen.dart';
import 'package:flutter_application_cake_bakery/screens/login/login_screen.dart';
import 'package:flutter_application_cake_bakery/screens/main/main_screen.dart';
import 'screens/account/setting_and_security/password_change/password_change_screen.dart';
import 'screens/account/setting_and_security/setting_security_screen.dart';
import 'screens/changepassword/change_pasword_screen.dart';
import 'screens/forgetpassword/forget_password_screen.dart';
import 'screens/resetpassword/reset_password_screen.dart';
import 'screens/signup/sign_up_screen.dart';

//import 'package:flutter_application_cake_bakery/screens/home/home_screen.dart';

void main() {
  runApp(const CakeBakery());
}

class CakeBakery extends StatelessWidget {
  const CakeBakery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cake Bakery',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => const LoginScreen(),
        '/main_screen': (context) => MainScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/forget_password': (context) => const ForgetPassword(),
        '/reset': (context) => const ResetPasswordScreen(),
        '/change': (context) => const ChangePassword(),
        'account': (context) => const AccountScreen(),
        'account/myprofile': (context) => const ProfileScreen(),
        'account/setting_and_security': (context) =>
            const SettingAndSecurityScreen(),
        'account/account_and_security/change_password': (context) =>
            const PasswordChangeScreen(),
      },
      initialRoute: '/',
    );
  }
}
