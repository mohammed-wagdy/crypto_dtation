
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {

  RxBool isGrid = false.obs;
  RxBool selectMyOffers = true.obs;
  TextEditingController payType = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

}
