import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/canceled.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/delivered.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/watting_confirm.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/watting_receive.dart';
import 'main.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
                child: const Material(
              child: TabBar(
                indicatorColor: primaryColor,
                isScrollable: true,
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Chờ xác nhận',
                  ),
                  Tab(
                    text: 'Đang giao',
                  ),
                  Tab(
                    text: 'Đã giao',
                  ),
                  Tab(
                    text: 'Đã hủy',
                  ),
                ],
              ),
            )),
            const Expanded(
                child: TabBarView(
              children: [
                WattingCofirm(),
                WattingReceive(),
                Delivered(),
                Canceled(),
              ],
            ))
          ],
        ));
  }
}
