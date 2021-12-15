import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/profile/components/profile_pic.dart';

Widget profileImgAndName() {
  return Container(
    color: const Color(0xFFFFDFD7),
    padding: const EdgeInsets.all(defaultPadding),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: ProfilePic(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nguỹn Thế Zjnk',
              style: myStyle(20, Colors.black, FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'hahahaa',
              style: myStyle(14, Colors.black87, FontWeight.w400),
            ),
          ],
        ),
      ],
    ),
  );
}
