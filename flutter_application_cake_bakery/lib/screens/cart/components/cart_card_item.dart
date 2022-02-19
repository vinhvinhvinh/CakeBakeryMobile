import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class CartCardItem extends StatefulWidget {
  CartCardItem({
    Key? key,
    required this.productName,
    required this.productTypeName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
  }) : super(key: key);

  final String productName, productTypeName, productImage;
  final int productPrice;
  int productQuantity;

  @override
  _CartCardItemState createState() => _CartCardItemState();
}

class _CartCardItemState extends State<CartCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'product_detail');
          print('Product Detail');
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFDBD3D3),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imgUrl + 'product/' + widget.productImage,
                        width: 85,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    margin: const EdgeInsets.only(left: 5),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${widget.productTypeName}',
                          style: myStyle(13, Colors.grey, FontWeight.normal),
                        ),
                        Container(
                          width: 120,
                          child: Text('${widget.productName}',
                              style:
                                  myStyle(16, Colors.black, FontWeight.w700)),
                        ),
                        Text(
                          formatMoney.format(widget.productPrice) + ' VND',
                          style: myStyle(
                              15, const Color(0xFFF08F5F), FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    height: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 65),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFFFFDFD1),
                          ),
                          child: IconButton(
                            color: const Color(0xFFF08F5F),
                            onPressed: () {
                              print('delete on cart');
                            },
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          width: 110,
                          height: 35,
                          child: Row(
                            children: [
                              IconButton(
                                padding: const EdgeInsets.only(
                                    bottom: kDefaultPadding / 2 + 2),
                                iconSize: 20,
                                onPressed: () {
                                  if (widget.productQuantity > 1) {
                                    setState(() {
                                      widget.productQuantity--;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.minimize),
                              ),
                              //const SizedBox(width: 5),
                              Text(
                                '${widget.productQuantity}',
                                style: myStyle(
                                    15, Colors.black, FontWeight.normal),
                              ),
                              //const SizedBox(width: 5),
                              IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  setState(() {
                                    widget.productQuantity++;
                                  });
                                },
                                icon: const Icon(Icons.add_outlined),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
