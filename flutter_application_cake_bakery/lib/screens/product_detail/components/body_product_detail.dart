import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/base_url.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:flutter_application_cake_bakery/database/db_helper.dart';
import 'package:flutter_application_cake_bakery/models/Product.dart';
import 'package:flutter_application_cake_bakery/models/comment.dart';
import 'package:flutter_application_cake_bakery/models/user.dart';
import 'package:flutter_application_cake_bakery/screens/cart/provider/cart_provider.dart';
import 'package:flutter_application_cake_bakery/screens/product_detail/provider/comment_provider.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final Product detail;
  const Body({Key? key, required this.detail}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int qtyy = 1;
  @override
  void initState() {
    super.initState();
    final comments = Provider.of<CommentProvider>(context, listen: false);
    comments.getCommentByProduct(context, widget.detail.id);
  }

  @override
  Widget build(BuildContext context) {
    final usser = DBHelper.instance.userr;
    return Column(
      children: [
        //Ảnh
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          width: 412,
          //color: Colors.blue,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: Image.network(
              imgUrl + '/product/' + widget.detail.image,
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
        ),
        //Loại sản phẩm
        Container(
          width: 412,
          height: 40,
          //color: Colors.yellow,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Còn lại:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  widget.detail.stock.toString() + ' chiếc',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        //Tên sản phẩm + favorite button
        Container(
          //color: Colors.pink,
          child: Row(
            children: [
              Container(
                width: 330,
                //color: Colors.white,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.detail.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: primaryColor,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
        ),
        //   //Gía sản phẩm
        Container(
          padding: const EdgeInsets.only(left: 20),
          //color: Colors.green,
          width: 412,
          child: Row(
            children: [
              Text(
                formatMoney.format(widget.detail.price),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  formatMoney.format(widget.detail.price),
                  style: TextStyle(
                      fontSize: 18, decoration: TextDecoration.lineThrough),
                ),
              ),
            ],
          ),
        ),
        //Số lượng + Button thêm vào giỏ hàng
        Container(
          //color: Colors.lightBlueAccent,
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      'Số lượng: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (qtyy > 1) qtyy--;
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      qtyy.toString(),
                      style: const TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          qtyy++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: primaryColor, // background
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .callAddToCart(
                            context, usser.id, widget.detail.id, qtyy);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      "Thêm vào \n giỏ hàng",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          width: 400,
          decoration: BoxDecoration(
            //color: Colors.purple,
            borderRadius: BorderRadius.circular(5),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Chi tiết sản phẩm',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                width: 350,
                child: Text(
                  widget.detail.description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            'Bình luận',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListComment(),
      ],
    );
  }

  Widget ListComment() {
    return Consumer<CommentProvider>(builder: (context, state, child) {
      return Expanded(
        child: ListView.builder(
          itemCount: state.lstComments.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              //color: Colors.purple,
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          imgUrl +
                              'user/' +
                              state.lstComments[index].avatar.toString(),
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Container(
                        //color: Colors.orange,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 145),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  state.lstComments[index].fullname.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              //color: Colors.yellow,
                              margin: const EdgeInsets.only(
                                left: 20,
                              ),
                              width: 260,
                              child: Text(
                                state.lstComments[index].content,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey,
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
