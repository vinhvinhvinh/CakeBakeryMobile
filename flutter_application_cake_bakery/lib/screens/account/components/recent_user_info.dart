import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/account/provider/user_provider.dart';
import 'package:provider/provider.dart';

class RecentUserInfo extends StatefulWidget {
  RecentUserInfo({Key? key}) : super(key: key);

  @override
  State<RecentUserInfo> createState() => _RecentUserInfoState();
}

class _RecentUserInfoState extends State<RecentUserInfo> {
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
              if (snapshot.data!.id == null) {
                return Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: defaultPadding / 2),
                      child: CircleAvatar(
                        radius: 40,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(btnColor),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.only(
                                    top: 10, bottom: 2, left: 2, right: 2)),
                          ),
                          onPressed: () {
                            print('Đăng nhập');
                          },
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          label: Text(
                            'Đăng nhập',
                            style:
                                myStyle(16, Colors.orange, FontWeight.normal),
                          ),
                        ),
                        InkWell(
                          child: const Text('Đăng kí',
                              style: TextStyle(
                                  color: Colors.orange, fontSize: 18)),
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(imgUrl +
                              'user/' +
                              (snapshot.data!.avatar ?? 'defaultuse.png')),
                          //backgroundImage: AssetImage("assets/images/marinhonda2.jpg"),
                        ),
                      ),
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
              }
            }

            return Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: defaultPadding / 2),
                  child: CircleAvatar(
                    radius: 40,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Text('Đăng nhập',
                          style: TextStyle(color: Colors.orange, fontSize: 18)),
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                    InkWell(
                      child: const Text('Đăng kí',
                          style: TextStyle(color: Colors.orange, fontSize: 18)),
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}

// Widget recentUserInfo(BuildContext context) {
//   UserDB user = Provider.of<UserProvider>(context, listen: false).user!;
//   return Container(
//     color: const Color(0xFFFFDFD7),
//     padding: const EdgeInsets.all(defaultPadding),
//     child: Row(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(20),
//           child: CircleAvatar(
//             radius: 50,
//             backgroundColor: Colors.white,
//             child: CircleAvatar(
//               radius: 45,
//               backgroundImage: NetworkImage(imgUrl + 'user/' + user.avatar!),
//               //backgroundImage: AssetImage("assets/images/marinhonda2.jpg"),
//             ),
//           ),
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
