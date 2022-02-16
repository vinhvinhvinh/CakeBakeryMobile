import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/profile/components/profile_pic.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileImgAndName extends StatefulWidget {
  ProfileImgAndName({Key? key}) : super(key: key);

  @override
  State<ProfileImgAndName> createState() => _ProfileImgAndNameState();
}

class _ProfileImgAndNameState extends State<ProfileImgAndName> {
  late UserDB userLogined;
  @override
  Widget build(BuildContext context) {
    final userLogined = Provider.of<UserProvider>(context);

    return Container(
      color: const Color(0xFFFFDFD7),
      padding: const EdgeInsets.all(defaultPadding),
      child: FutureBuilder(
          future: userLogined.getUserData(),
          builder: (context, AsyncSnapshot<UserDB> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.id != null) {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: ProfilePic(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.fullname,
                          style: myStyle(20, Colors.black, FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          snapshot.data!.email,
                          style: myStyle(14, Colors.black87, FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                print('Không render được');
              }
            }
            return const SizedBox(
              height: 100,
              child: Text('Bạn vẫn chưa đăng nhập mà !!'),
            );
          }),
    );
  }
}

// Widget profileImgAndName(BuildContext context) {
//   UserDB user = Provider.of<UserProvider>(context, listen: false).user!;
//   return Container(
//     color: const Color(0xFFFFDFD7),
//     padding: const EdgeInsets.all(defaultPadding),
//     child: Row(
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(20),
//           child: ProfilePic(),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               user.fullname,
//               style: myStyle(20, Colors.black, FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               user.email,
//               style: myStyle(14, Colors.black87, FontWeight.w400),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
