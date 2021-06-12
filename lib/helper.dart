
import 'dart:io';
import 'dart:math';

import 'package:crypto_station/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static errorSnackBar(title,message) {
    return Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10.0),
        backgroundColor: Color(0XFFc0392b),
        colorText: Colors.white,
      isDismissible: true,
      borderRadius: 15.0,
    );
  }


  static successSnackBar(title,message) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10.0),
      backgroundColor: Color(0XFF27ae60),
      colorText: Colors.white,
      isDismissible: true,
      borderRadius: 15.0,
    );
  }


  static List<Icon> getStarsList(double rate, {double size = 18}) {
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: rateColor);
    });
    if (rate - rate.floor() > 0) {
      list.add(Icon(Icons.star_half, size: size, color: rateColor));
    }
    list.addAll(
        List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
          return Icon(Icons.star_border, size: size, color: rateColor);
        }));
    return list;
  }
}




class Tools {
  /// check tablet screen
  static bool isTablet(MediaQueryData query) {
    if (kIsWeb) {
      return true;
    }

    if (Platform.isWindows || Platform.isMacOS) {
      return false;
    }

    var size = query.size;
    var diagonal =
    sqrt((size.width * size.width) + (size.height * size.height));

    var isTablet = diagonal > 1090.0;
    return isTablet;
  }
}