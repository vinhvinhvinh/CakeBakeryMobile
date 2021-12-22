import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Banners extends StatelessWidget {
  const Banners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CarouselSlider(
            items: [
              Banner('ABC', 'Năng lượng để tiếp tục niềm vui', 'banner-1.jpg'),
              Banner(
                  'BCD', 'Tinh hoa ẩm thực Con người Việt Nam', 'banner-2.jpg'),
              Banner(
                  'CDE',
                  'Mời bạn một miếng bánh ngon,\n Một tách trà nóng, Một ngày an yên',
                  'banner-3.jpg'),
              
            ],
            options: CarouselOptions(
              //height: 60.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 22 / 8,
              autoPlayCurve: Curves.easeInOutSine,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

Widget Banner(String bannerTitle, String subTitle, String image) {
  return Container(
    //margin: EdgeInsets.only(left: kDefaultPadding / 2),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/banner/$image',
            fit: BoxFit.fill,
            width: 448,
            height: 150,
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: kDefaultPadding / 2),
              child: Text(
                bannerTitle,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.only(
                  left: kDefaultPadding, top: kDefaultPadding / 2),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}