import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/SearchResult/components/body_search_result.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 24,
        ),
        onPressed: () =>Navigator.pop(context),
      ),
      title: Container(
        height: 65,
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: TextField(
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Enter the keyword ...',
            hintStyle: const TextStyle(color: primaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            // By default our  icon color is white
            size: 24,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
