import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

Widget recentUserInfo() {
  return Container(
    color: const Color(0xFFFFC2D0),
    padding: const EdgeInsets.all(defaultPadding),
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage(
                  "https://instagram.fvca1-4.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s750x750/231585679_350578173305985_6719501263762081001_n.jpg?_nc_ht=instagram.fvca1-4.fna.fbcdn.net&_nc_cat=109&_nc_ohc=BKbMWBKH-SAAX-vWqUF&edm=AP_V10EBAAAA&ccb=7-4&oh=0372162811679d68b9401b039baf9920&oe=61BE00D8&_nc_sid=4f375e"),
            ),
          ),
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
