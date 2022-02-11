import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/account_provider.dart';
import 'package:provider/provider.dart';

Widget recentUserInfo(BuildContext context) {
  User user = Provider.of<AccountProvider>(context, listen: false).user!;
  return Container(
    color: const Color(0xFFFFDFD7),
    padding: const EdgeInsets.all(defaultPadding),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(imgUrl + 'user/' + user.avatar!),
              //backgroundImage: AssetImage("assets/images/marinhonda2.jpg"),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.fullname,
              style: myStyle(20, Colors.black, FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user.email,
              style: myStyle(14, Colors.black87, FontWeight.w400),
            ),
          ],
        ),
      ],
    ),
  );
}
