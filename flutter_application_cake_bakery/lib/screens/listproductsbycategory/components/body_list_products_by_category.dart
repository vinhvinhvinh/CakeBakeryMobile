import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/account/myorder/components/main.dart';
import 'package:flutter_application_cake_bakery/screens/home/provider/product_provider.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../base_url.dart';

class Body extends StatefulWidget {
  final String id;
  const Body({Key? key, required this.id}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
@override
  void initState() {
    super.initState();
    final products = Provider.of<ProductProvider>(context, listen: false);
    products.getProductByType(context, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    //return Container();
    return Consumer<ProductProvider>(builder: (context, state, child){
      return ListView.builder(
        itemBuilder: (context, index) {
          return ProductItem(name: state.products[index].name,image: state.products[index].image,price: state.products[index].price,);
        },
        itemCount: state.products.length,
      );
     }); 
  }
}

class ProductItem extends StatefulWidget {
final String name;
final String image;
final int price;
  ProductItem({
    Key? key, required this.name, required this.image, required this.price,
    //required this.product,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.black.withOpacity(0.2),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Stack(children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                child: Image.network(
                              imgUrl +
                                  '/product/' +
                                  widget.image,
                  height: 130,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Stack(
                children: [
                  //Product Name
                  Column(
                    children: [
                      Container(
                        //color: Colors.amber,
                        padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                        width: 237,
                        child: Row(
                          children: [
                            Container(
                              //padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              width: 140,
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                    color: ktextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                              icon: Icon(
                                _isChecked
                                    ? Icons.favorite_sharp
                                    : Icons.favorite_outline,
                                color: primaryColor,
                              ),
                              iconSize: 32,
                              color: primaryColor,
                            ),
                          ],
                        ),
                      ),
                      //Price Product
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        width: 237,
                        //color: Colors.green,
                        child: Row(
                          children: [
                            Text(
                              formatMoney.format(widget.price),
                              style: const TextStyle(
                                  color: ktextColor, fontSize: 20),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: primaryColor,
                                
                              ),
                              iconSize: 32,
                            ),
                          ],
                        ),
                      ),
                      //Icon Cart-Shopping
                    ],
                  ),
                ],
              ),
              // Container(
              //   //color: Colors.blue,
              //   width: 30,
              //   child: IconButton(
              //     onPressed: () => Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => ProductDetail(detail: ,),
              //       ),
              //     ),
              //     icon: const Icon(
              //       Icons.arrow_forward_ios,
              //     ),
              //   ),
              // ),
            ],
          ),
        ]),
      ),
    );
  }
}
