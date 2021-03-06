import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/home/provider/product_provider.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../base_url.dart';

class BestSellingProduct extends StatefulWidget {
  const BestSellingProduct({Key? key}) : super(key: key);

  @override
  State<BestSellingProduct> createState() => _BestSellingProductState();
}

class _BestSellingProductState extends State<BestSellingProduct> {
  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductProvider>(context, listen: false);
    products.bestSelling(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWithButton(),
        Consumer<ProductProvider>(
          builder: (context, state, child) {
            return Container(
              height: 130,
              child: ListView.builder(
                itemCount: state.bestSellingproducts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          detail: state.bestSellingproducts[index],
                        ),
                      ),
                    ),
                    child: ProductBestSelling(
                      image: state.bestSellingproducts[index].image,
                      productName: state.bestSellingproducts[index].name,
                      price: state.bestSellingproducts[index].price,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

//Product best selling
class ProductBestSelling extends StatelessWidget {
  final String image;
  final String productName;
  final int price;

  const ProductBestSelling({
    Key? key,
    required this.image,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: primaryColor.withOpacity(0.7),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: const EdgeInsets.all(kDefaultPadding / 2),
        ),
        Container(
          //margin: EdgeInsets.only(left:kDefaultPadding / 2),
          margin: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  imgUrl + 'product/' + image,
                  width: 100,
                  height: 105,
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
                  Container(
                    width: 170,
                    child: Text(
                      productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                  //Price
                  Text(
                    formatMoney.format(price),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: kDefaultPadding / 2,
                  ),

                  //Evaluate
                ],
              ),
              //),
            ],
          ),
        ),
      ],
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
              "B??n ch???y nh???t",
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
            "Xem",
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
