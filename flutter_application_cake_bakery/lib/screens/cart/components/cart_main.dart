import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/cart/components/cart_card_item.dart';
import 'package:flutter_application_cake_bakery/screens/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class CartMain extends StatefulWidget {
  const CartMain({Key? key}) : super(key: key);

  @override
  _CartMainState createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  final userr = DBHelper.instance.userr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //final productsInCart = Provider.of<CartProvider>(context, listen: false);
    //productsInCart.getProductInCart(context, userr.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, state, child) {
      return ListView.builder(
          itemCount: state.productsInCart.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            // return CartCardItem(
            //   productName: state.productsInCart[index].name,
            //   productTypeName: state.productsInCart[index].typeName,
            //   productImage: state.productsInCart[index].image,
            //   productPrice: state.productsInCart[index].price,
            //   productQuantity: state.productsInCart[index].quantity,
            // );
            return Container(
              key: Key(state.productsInCart[index].id.toString()),
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
                                imgUrl +
                                    'product/' +
                                    state.productsInCart[index].image,
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
                                  state.productsInCart[index].typeName,
                                  style: myStyle(
                                      13, Colors.grey, FontWeight.normal),
                                ),
                                Container(
                                  width: 120,
                                  child: Text(state.productsInCart[index].name,
                                      style: myStyle(
                                          16, Colors.black, FontWeight.w700)),
                                ),
                                Text(
                                  formatMoney.format(
                                      state.productsInCart[index].price),
                                  style: myStyle(15, const Color(0xFFF08F5F),
                                      FontWeight.bold),
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
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title:
                                            const Text('Bạn chắc chắn chứ ?'),
                                        content: Text(
                                            'Bạn có muốn xóa sản phẩm ' +
                                                state.productsInCart[index].name
                                                    .toUpperCase() +
                                                ' khỏi giỏ hàng'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'Hủy'),
                                            child: const Text('Hủy'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              print('deleted ' +
                                                  '${state.productsInCart[index].name}');
                                              //Xóa khỏi giỏ hàng (API)
                                              state.callDeleteCartRow(
                                                  context,
                                                  state.productsInCart[index]
                                                      .id);
                                              //Set lại State (xóa khỏi màn hình)
                                              setState(() {
                                                state.productsInCart
                                                    .removeAt(index);
                                              });
                                              Navigator.pop(context, 'OK');
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                          if (state.productsInCart[index]
                                                  .quantity >
                                              1) {
                                            state.callUpdateCartQty(
                                                context,
                                                state.productsInCart[index].id,
                                                -1);
                                            setState(() {
                                              state.productsInCart[index]
                                                  .quantity--;
                                            });
                                          }
                                        },
                                        icon: const Icon(Icons.minimize),
                                      ),
                                      //const SizedBox(width: 5),
                                      Text(
                                        '${state.productsInCart[index].quantity}',
                                        style: myStyle(15, Colors.black,
                                            FontWeight.normal),
                                      ),
                                      //const SizedBox(width: 5),
                                      IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          state.callUpdateCartQty(
                                              context,
                                              state.productsInCart[index].id,
                                              1);
                                          setState(() {
                                            state.productsInCart[index]
                                                .quantity++;
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
          });
    });
  }
}
