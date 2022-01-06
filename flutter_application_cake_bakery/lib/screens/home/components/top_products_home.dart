import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/product_detail_screen.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            return buildProductItems(
              product: lstProducts[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(),
                ),
              ),
            );
          },
          itemCount: lstProducts.length,
        ),
      ],
    );
  }
}

class buildProductItems extends StatefulWidget {
  const buildProductItems({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final Function press;
  @override
  State<buildProductItems> createState() => _buildProductItemsState();
}

class _buildProductItemsState extends State<buildProductItems> {
  bool _isChecked = false;

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
                  child: Image.asset(
                    "assets/images/${widget.product.image}",
                    //height: 155,
                    fit: BoxFit.fitWidth,
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
                    '${widget.product.productName}',
                    style: const TextStyle(
                        color: ktextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                //Price Product
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "${widget.product.price} đ",
                        style: TextStyle(color: ktextColor, fontSize: 18),
                      ),
                    ),
                    // //Icon Cart-Shopping
                    Padding(
                      padding: EdgeInsets.only(left: 30),
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
