import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/searchresult/components/body_search_result.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SearchResult extends StatefulWidget {
final String value;
  const SearchResult({Key? key, required this.value}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BodySearch(value: widget.value),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final value=TextEditingController();
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
          controller: value,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            hintText: widget.value,
            hintStyle: const TextStyle(color: primaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchResult(value: value.text)),
            ),
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
