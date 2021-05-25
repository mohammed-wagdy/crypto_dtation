import 'package:crypto_station/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDarkAppBar extends StatelessWidget {

  final GlobalKey<ScaffoldState> drawerKey;
  final String appBarTitle;

  CustomDarkAppBar({required this.drawerKey,required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_back_ios,size: 20,)
      ),
      title: Text(appBarTitle,style: TextStyle(height: 1.6),),
      centerTitle: true,
    );
  }
}
