import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/screens/account/profile/components/info_area.dart';

import 'profile_img_name.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProfileImgAndName(),
        const InfomationArea(),
      ],
    );
  }
}
