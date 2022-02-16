import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'directional_user.dart';
import 'recent_user_info.dart';
//import 'package:flutter/widgets.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        RecentUserInfo(),
        DirectionalUser(),
      ],
    );
  }
}
