import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/searchresult/search_result.dart';


class SearchBarHome extends StatefulWidget {
  const SearchBarHome({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBarHome> createState() => _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {
  final value=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        controller: value,
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
              MaterialPageRoute(builder: (context) => SearchResult(value: value.text)),
            ),
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
