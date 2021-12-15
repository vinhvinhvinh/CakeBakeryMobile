
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleTopProducts(),
        TopProduct(
          image: '1.png',
          productName: 'JHJKHKKL',
          price: '30 000',
          press: () {},
        ),
      ],
    );
  }
}

class TopProduct extends StatelessWidget {
  final String image;
  final String productName;
  final String price;
  final Function press;
  const TopProduct(
      {Key? key,
      required this.image,
      required this.productName,
      required this.price,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 20,
            child: Column( 
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: buildProductItems(
                          image: image, productName: productName, price: price),
                    ),
                    const SizedBox(width:15),
                    Expanded(
                      flex: 4,
                      child: buildProductItems(
                          image: image, productName: productName, price: price),
                    ),
                  ],
                ),
                const SizedBox(height:15),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: buildProductItems(
                          image: image, productName: productName, price: price),
                    ),
                    const SizedBox(width:15),
                    Expanded(
                      flex: 4,
                      child: buildProductItems(
                          image: image, productName: productName, price: price),
                    ),
                  ],
                ),
                const SizedBox(height:15),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: buildProductItems(
                          image: image, productName: productName, price: price),
                    ),
                    const SizedBox(width:15),
                    Expanded(
                      flex: 4,
                      child: buildProductItems(
                          image: image, productName: productName, price: price),
                    ),
                  ],
                ),
                const SizedBox(height:30),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class buildProductItems extends StatelessWidget {
  const buildProductItems({
    Key? key,
    required this.image,
    required this.productName,
    required this.price,
  }) : super(key: key);

  final String image;
  final String productName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      
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
                  "assets/images/$image",
                  height: 185,
                  fit: BoxFit.cover,
                ),
              ),
              //Icon heart-favorite
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding * 6),
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite_border,
                    color: primaryColor,
                    size: 36,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          //Product name+price + icon cart-shopping
          Stack(
            children: [
              //Product Name
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                child: Text(
                  productName,
                  style: const TextStyle(
                      color: ktextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              //Price Product
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 55, 10, 10),
                child: Text(
                  "$price đ",
                  style: TextStyle(color: ktextColor, fontSize: 18),
                ),
              ),
              //Icon Cart-Shopping
              Padding(
                padding: EdgeInsets.only(left: 120, top: 35),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
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
