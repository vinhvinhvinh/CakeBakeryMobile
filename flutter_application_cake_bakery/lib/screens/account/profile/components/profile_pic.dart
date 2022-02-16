import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/account_provider.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../base_url.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late UserDB userLogined;
  @override
  Widget build(BuildContext context) {
    final userLogined = Provider.of<UserProvider>(context);
    return SizedBox(
      height: 100,
      width: 100,
      child: FutureBuilder(
        future: userLogined.getUserData(),
        builder: (context, AsyncSnapshot<UserDB> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.id == null) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Bạn chưa đăng nhập',
                  style: myStyle(15, Colors.black45, FontWeight.bold),
                ),
              );
            } else {
              return Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl +
                        'user/' +
                        (snapshot.data!.avatar ?? 'defaultuse.png')),
                  ),
                  Positioned(
                    right: -10,
                    bottom: 0,
                    child: SizedBox(
                      height: 35,
                      width: 35,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(color: Colors.white),
                          ),
                          primary: Colors.white,
                          backgroundColor: const Color(0xFFF5F6F9),
                        ),
                        onPressed: () {
                          print('change avatar');
                        },
                        child: SvgPicture.asset("assets/svg/Camera Icon.svg"),
                      ),
                    ),
                  )
                ],
              );
            }
          }
          return Text(
            'Bạn chưa đăng nhập',
            style: myStyle(15, Colors.black45, FontWeight.bold),
          );
        },
      ),
    );
  }
}
