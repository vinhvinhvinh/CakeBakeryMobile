import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class Product extends StatelessWidget {
  final String image;
  final String productname;
  final String price;
  final String totalPrice;
  final String text;
  final String time;
  const Product({
    Key? key,
    required this.image,
    required this.productname,
    required this.price,
    required this.totalPrice,
    required this.text,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding/3)),
              Text(
                text,
                style: myStyle(18, Color(0xFF8C8181), FontWeight.normal),
              ),
              const SizedBox(
                width: (kDefaultPadding / 3),
              ),
              Text(time, style: myStyle(18,  Color(0xFF8C8181), FontWeight.normal),),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
            color: const Color(0xFF8C8181).withOpacity(0.09),
            child: Row(           
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/$image',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: (kDefaultPadding * 2),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2)),
                    Text(
                      productname,
                      style:
                           myStyle(18, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: (kDefaultPadding / 2),
                    ),
                    Text(price),
                  ],
                ),
                const SizedBox(
                  width: (kDefaultPadding*2),
                ),
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: kDefaultPadding * 2)),
                    Text('X$totalPrice',
                        style:  myStyle(18, Colors.black, FontWeight.bold),),
                    const SizedBox(
                      height: (kDefaultPadding / 2),
                    ),
                    Text('Total Price',
                      style:  myStyle(18, Colors.black, FontWeight.bold),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
