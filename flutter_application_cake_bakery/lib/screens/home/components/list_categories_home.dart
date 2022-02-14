import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/home/provider/product_type_provider.dart';
import 'package:flutter_application_cake_bakery/screens/listproductsbycategory/list_products_by_catergory_screen.dart';
import 'package:provider/provider.dart';

import '../../../base_url.dart';

class ListCategories extends StatefulWidget {
  const ListCategories({Key? key}) : super(key: key);

  @override
  State<ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductTypeProvider>(context, listen: false);
    products.getProductType(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithButton(),
        Consumer<ProductTypeProvider>(
          builder: (context, state, child) {
            return Container(
              height: 130,
              child: ListView.builder(
                  itemCount: state.productTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsByCategory(
                                  type: state.productTypes[index],
                                ),
                              ),
                            ),
                        child: Category(
                            image: state.productTypes[index].image,
                            categoryName: state.productTypes[index].name));
                  }),
            );
          },
        )
      ],
    );
  }

  // Widget CategoriesList(BuildContext context) {
  //   return Container(
  //     height: 130,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Category();
  //       },
  //     ),
  //   );
  // }
}

class Category extends StatelessWidget {
  final String? image;
  final String categoryName;

  const Category({
    Key? key,
    this.image,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 100,
          height: 105,
          margin: const EdgeInsets.all(kDefaultPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
        Container(
          //mainAxisAlignment: MainAxisAlignment.center,
          padding: const EdgeInsets.fromLTRB(18, 0, 1, 12),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 2,
                    color: primaryColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    imgUrl + '/producttype/' + image!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Text(
                  categoryName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                margin: const EdgeInsets.only(top: 3),
              ),
            ],
          ),
        ),
      ],
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
              "CATEGORIES",
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
