
import 'package:crypto_station/constants.dart';
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
}