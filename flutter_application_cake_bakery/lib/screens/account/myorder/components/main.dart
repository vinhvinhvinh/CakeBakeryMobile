import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

import '../../../../base_url.dart';

class Product extends StatelessWidget {
  final String image;
  final String productname;
  final int? price;
  final int? quantity;
  final int totalPrice;
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
    this.quantity,
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
                  padding: EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                      horizontal: kDefaultPadding / 3)),
              Text(
                text,
                style: myStyle(18, Color(0xFF8C8181), FontWeight.normal),
              ),
              const SizedBox(
                width: (kDefaultPadding / 3),
              ),
              Text(
                time,
                style: myStyle(18, Color(0xFF8C8181), FontWeight.normal),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFF8C8181).withOpacity(0.09),
            ),
            padding:
                const EdgeInsets.only(left: 0, right: 10, top: 0, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                  imgUrl + '/product/' + image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                //const SizedBox(width: (kDefaultPadding * 2),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2)),
                    Container(
                      width: 140,
                      child: Text(
                        productname,
                        style: myStyle(18, Colors.black, FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: (kDefaultPadding / 2),
                    ),
                    Text( formatMoney.format(price),),
                  ],
                ),
                //const SizedBox(width: (kDefaultPadding * 2),),
                Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: kDefaultPadding * 2)),
                    Text(
                      'X$quantity',
                      style: myStyle(18, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: (kDefaultPadding / 2),
                    ),
                    Text(
                       formatMoney.format(totalPrice),
                      style: myStyle(18, Colors.black, FontWeight.bold),
                    ),
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
