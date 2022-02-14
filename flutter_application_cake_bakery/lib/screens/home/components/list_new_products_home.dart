import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/home/provider/product_provider.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../base_url.dart';

class NewProducts extends StatefulWidget {
  const NewProducts({Key? key}) : super(key: key);

  @override
  State<NewProducts> createState() => _NewProductsState();
}

class _NewProductsState extends State<NewProducts> {
  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductProvider>(context, listen: false);
    products.getNewProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithButton(),
        Consumer<ProductProvider>(builder: (context, state, child) {
          return Container(
            height: 130,
            child: ListView.builder(
              itemCount: state.newProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return NewProds(
                  name: state.newProducts[index].name,
                  image: state.newProducts[index].image,
                );
              },
            ),
          );
        })
      ],
    );
  }

  // Widget newProduct(String image, String price, BuildContext context) {
  //   return GestureDetector(
  //     onTap: () => Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ProductDetail(),
  //       ),
  //     ),
  //     child: Container(
  //       height: 130,
  //       // color: Colors.green,
  //       child: Stack(
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.only(left: kDefaultPadding / 2),
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(20),
  //               child: Image.asset(
  //                 'assets/images/$image',
  //                 width: 130,
  //                 height: 130,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           Container(
  //               padding: const EdgeInsets.only(left: kDefaultPadding),
  //               child: const Icon(
  //                 Icons.fiber_new,
  //                 color: Colors.red,
  //                 size: 30,
  //               )),
  //           Container(
  //             width: 120,
  //             padding: const EdgeInsets.fromLTRB(37, 105, 0, 0),
  //             child: Text(
  //               '$price đ',
  //               style: const TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 18,
  //                   color: backgroundColor,
  //                   shadows: [
  //                     Shadow(
  //                       blurRadius: 20.0,
  //                       color: ktextColor,
  //                     ),
  //                   ]),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class NewProds extends StatelessWidget {
  final String name;
  final String image;
  //final String price;
  const NewProds({
    Key? key,
    required this.name,
    required this.image,
    //required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetail(),
        ),
      ),
      child: Container(
        height: 130,
        // color: Colors.green,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: kDefaultPadding / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imgUrl + '/product/' + image,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: const Icon(
                  Icons.fiber_new,
                  color: Colors.red,
                  size: 30,
                )),
            Container(
              width: 120,
              padding: const EdgeInsets.fromLTRB(17, 90, 0, 0),
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: ktextColor,
                      ),
                    ]),
              ),
            ),
          ],
        ),
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
            backgroundColor: primaryColor, // background
            primary: Colors.orange, // foreground text
            side: const BorderSide(color: Colors.white),
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
