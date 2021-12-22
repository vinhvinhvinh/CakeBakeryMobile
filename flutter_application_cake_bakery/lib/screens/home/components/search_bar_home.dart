import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/SearchResult/search_result.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          hintText: 'Nhập từ khóa tìm kiếm',
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchResult()),
            ),
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
