import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/screens/listproductsbycategory/list_products_by_catergory_screen.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithButton(),
        CategoriesList(context),
      ],
    );
  }

  Widget CategoriesList(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image: '1.png',
            categoryName: 'DONUT',
            press: () {},
          ),
          Category(
            image: '2.png',
            categoryName: 'CUPCAKE',
            press: () {},
          ),
          Category(
            image: 'c-feature-6.jpg',
            categoryName: 'GATO',
            press: () {},
          ),
          Category(
            image: '1.png',
            categoryName: 'DONUT',
            press: () {},
          ),
          Category(
            image: '2.png',
            categoryName: 'CUPCAKE',
            press: () {},
             
            
          ),
          Category(
            image: 'c-feature-6.jpg',
            categoryName: 'GATO',
            press: (){},
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image;
  final String categoryName;
  final Function press;
  const Category({
    Key? key,
    required this.image,
    required this.categoryName,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsByCategory(),
              ),
            ),
      child: Stack(
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
                    child: Image.asset(
                      'assets/images/$image',
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
                  margin: EdgeInsets.only(top: 3),
                ),
              ],
            ),
          ),
        ],
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
