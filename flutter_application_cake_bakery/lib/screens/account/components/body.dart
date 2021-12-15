import 'package:flutter/material.dart';

import 'directional_user.dart';
import 'recent_user_info.dart';
//import 'package:flutter/widgets.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        recentUserInfo(),
        directionalUser(),
      ],
    );
  }
}
