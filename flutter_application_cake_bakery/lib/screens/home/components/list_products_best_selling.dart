import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/product_detail_screen.dart';

class BestSellingProduct extends StatelessWidget {
  const BestSellingProduct({Key? key}) : super(key: key);

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
              ProductBestSelling(
                image: '1.png',
                price: '30 000 VND',
                productName: 'Cupcake Matcha',
                press: () {},
              ),
              ProductBestSelling(
                image: '2.png',
                price: '30 000 VND',
                productName: 'Cupcake Matcha',
                press: () {},
              ),
              ProductBestSelling(
                image: '3.png',
                price: '30 000 VND',
                productName: 'Cupcake Matcha',
                press: () {},
              ),
              ProductBestSelling(
                image: '1.png',
                price: '30 000 VND',
                productName: 'Cupcake Matcha',
                press: () {},
              ),
              ProductBestSelling(
                image: '2.png',
                price: '30 000 VND',
                productName: 'Cupcake Matcha',
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//Product best selling
class ProductBestSelling extends StatelessWidget {
  final String image;
  final String productName;
  final String price;
  final Function press;
  const ProductBestSelling({
    Key? key,
    required this.image,
    required this.productName,
    required this.price,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetail(),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 110,
            width: 300,
            color: Colors.white,
            margin: const EdgeInsets.all(kDefaultPadding / 2),
          ),
          Container(
            //margin: EdgeInsets.only(left:kDefaultPadding / 2),
            margin: const EdgeInsets.only(left: kDefaultPadding / 2),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/$image',
                    width: 100,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding / 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    //Product Name
                    Text(
                      productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    //Price
                    Text(
                      price,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),

                    //Evaluate
                    Row(
                      children: const [
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
                //),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Title with button
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
              "BEST SELLING",
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
