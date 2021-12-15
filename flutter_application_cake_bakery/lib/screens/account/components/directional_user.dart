import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

Widget directionalUser() {
  return Container(
    padding: const EdgeInsets.all(27),
    child: Column(
      children: [
        directionalUserItem(
          'My Profile',
          Icons.person_rounded,
          'account/myprofile',
          '',
        ),
        directionalUserItem(
          'My Orders',
          Icons.receipt_long_outlined,
          '/myorder',
          '',
        ),
        directionalUserItem(
          'Notifications',
          Icons.notifications_active_rounded,
          '/notification',
          '',
        ),
        directionalUserItem(
          'Settings and Security',
          Icons.settings,
          'account/setting_and_security',
          '',
        ),
        directionalUserItem(
          'Languages',
          Icons.language_rounded,
          '/language',
          'English',
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(btnColor),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(
                    top: 10, bottom: 10, left: 30, right: 30)),
          ),
          onPressed: () {
            print('Log out');
          },
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.white,
            size: 24.0,
          ),
          label: Text(
            'Logout',
            style: myStyle(16, Colors.white, FontWeight.normal),
          ),
        ),
      ],
    ),
  );
}

Widget directionalUserItem(
    String text, IconData icon, String routeName, String trailing) {
  return Column(
    children: <Widget>[
      PageRoute(
        text: text,
        iconLeading: icon,
        redirectTo: routeName,
        trailingPath: trailing,
      ),
      const Divider(thickness: 1, height: 1),
    ],
  );
}

class PageRoute extends StatelessWidget {
  const PageRoute({
    Key? key,
    required this.text,
    required this.iconLeading,
    required this.trailingPath,
    required this.redirectTo,
  }) : super(key: key);

  final String text, redirectTo, trailingPath;
  final IconData iconLeading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconLeading),
      trailing: Text(trailingPath),
      title: Text(text, style: myStyle(16, Colors.black87, FontWeight.normal)),
      onTap: () {
        Navigator.pushNamed(context, redirectTo);
      },
    );
  }
}
