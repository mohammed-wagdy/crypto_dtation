import 'package:crypto_station/constants.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDarkAppBar extends StatelessWidget {

  final BuildContext drawerContext;
  final String appBarTitle;
  final bool noBackPage;
  final bool noBackground;

  CustomDarkAppBar({required this.drawerContext,required this.appBarTitle,this.noBackPage = false,this.noBackground = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: noBackground ? whiteColor : mainColor,
      elevation: 1.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => noBackPage ? Get.toNamed(Routes.HOME) : Get.back(),
        icon: Icon(Icons.arrow_back_ios,size: 20,color: noBackground ? mainColor : whiteColor,)
      ),
      title: Text(appBarTitle,style: TextStyle(height: 1.6,color: noBackground ? mainColor : whiteColor,),),
      centerTitle: true,
    );
  }
}
