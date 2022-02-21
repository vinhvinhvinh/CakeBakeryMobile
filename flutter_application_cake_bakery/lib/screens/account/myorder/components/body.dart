import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/canceled.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/delivered.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/watting_confirm.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/watting_receive.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userLogined = Provider.of<UserProvider>(context);
    return FutureBuilder(
      future: userLogined.getUserData(),
      builder: (context, AsyncSnapshot<UserDB> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.id != null) {
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
                    ),
                  ),
                ],
              ),
            );
          }
        }
        return Center(
              child: Container(
                //color:Colors.amberAccent,
                child: Text(
                  'Chưa đăng nhập',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            );
      },
    );
  }
}
