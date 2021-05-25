import 'dart:math';

import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:crypto_station/widgets/list_user_block.dart';
import 'package:crypto_station/widgets/slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}

class HomePageScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(children: [
        // Slider
        CarouselSlider(
            items: [
              SliderWidget(
                titleName: "العروض الخاصة",
                count: 20,
                changeColor: true,
              ),
              SliderWidget(
                titleName: "العروض المنتهية",
                count: 60,
              ),
              SliderWidget(
                titleName: "العروض قيد المراجعة",
                count: 45,
              ),
            ],
            options: CarouselOptions(
              height: 155,
              // aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              //onPageChanged: callbackFunction,
              // scrollDirection: Axis.horizontal,
            )),

        // Grid Of Users
        Expanded(
          //child: ListUserBlock()
          child: GridUserBlock(),
        ),

        SizedBox(
          height: 15,
        ),
      ]),
    );
  }
}
