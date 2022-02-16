import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
//import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/network/network_product.dart';
import 'package:flutter_application_cake_bakery/screens/home/provider/product_provider.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../../../base_url.dart';

class TopProducts extends StatefulWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  State<TopProducts> createState() => _TopProductsState();
}

class _TopProductsState extends State<TopProducts> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductProvider>(context, listen: false);
    products.getAll(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, state, child) {
      return Column(
        children: [
          const TitleTopProducts(),
          GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              mainAxisExtent: 260,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      detail: state.topProducts[index],
                    ),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: primaryColor.withOpacity(0.5),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      //Image + icon heart-shopping
                      Stack(
                        children: [
                          //Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              imgUrl +
                                  '/product/' +
                                  state.topProducts[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          //Icon heart-favorite
                          Padding(
                            padding: const EdgeInsets.only(left: 125),
                            child: IconButton(
                              icon: Icon(
                                _isChecked
                                    ? Icons.favorite_sharp
                                    : Icons.favorite_outline,
                                color: primaryColor,
                                size: 36,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      //Product name+price + icon cart-shopping
                      Column(
                        children: [
                          //Product Name
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Text(
                              state.topProducts[index].name,
                              style: const TextStyle(
                                  color: ktextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                          //Price Product
                          Row(
                            children: [
                              Container(
                                width: 120,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  formatMoney
                                      .format(state.topProducts[index].price),
                                  style: TextStyle(
                                      color: ktextColor, fontSize: 18),
                                ),
                              ),
                              // //Icon Cart-Shopping
                              Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.shopping_cart_outlined,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: state.topProducts.length,
          ),
        ],
      );
    });
  }
}

class TitleTopProducts extends StatelessWidget {
  const TitleTopProducts({
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
              "TOP PRODUCTS",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: primaryColor, // background
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
