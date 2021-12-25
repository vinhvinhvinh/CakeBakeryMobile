
import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
            child: Image.asset(
              "assets/images/3.png",
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
                  'Loại:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Tên loại sản phẩm',
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
                  'Bánh Cupcake Matcha ',
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
                '25 000đ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  '30 000đ',
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
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                    Text(
                      '1',
                      style: const TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove),
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
                  onPressed: () {},
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
                  'Thông tin chi tiết sản phẩm Thông tin chi tiết sản phẩm Thông tin chi tiết sản phẩm',
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
        Comment(),
        const Divider(
          height: 5,
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        Comment(),
        const Divider(
          height: 5,
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget Comment() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        //color: Colors.purple,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/account/avatar-1.jpg',
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
                        'Tên khách hàng',
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
                    width: 280,
                    child: Text(
                      'Bánh ngon quá ạ! Nên mua nha mọi người, Ngon quá trời quá đất',
                      style:TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
