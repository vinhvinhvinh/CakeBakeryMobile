
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWithButton(),
        Container(
          height: 130,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              newProduct('c-feature-3.jpg', '30 000'),
              newProduct('c-feature-4.jpg', '30 000'),
              newProduct('c-feature-5.jpg', '30 000'),
              newProduct('c-feature-6.jpg', '30 000'),
            ],
          ),
        )
      ],
    );
  }

  Container newProduct(String image, String price) {
    return Container(
      height: 130,
      // color: Colors.green,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: kDefaultPadding / 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/$image',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: Icon(
                Icons.fiber_new,
                color: Colors.red,
                size: 30,
              )),
          Container(
            width: 120,
            padding: EdgeInsets.fromLTRB(37, 105, 0, 0),
            child: Text(
              '$price đ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: backgroundColor,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: ktextColor,
                    ),
                    
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Text(
              "NEW",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: primaryColor , // background
            primary: Colors.orange, // foreground text
            side: BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "View All",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          width: kDefaultPadding / 2,
        ),
      ],
    );
  }
}
