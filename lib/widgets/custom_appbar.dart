import 'package:crypto_station/constants.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {

  final BuildContext drawerContext;

  CustomAppBar({required this.drawerContext});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Scaffold.of(drawerContext).openDrawer(),
        icon: Image.asset("assets/images/menu_icon.png",width: 20,),
      ),
      title: Text("Crypto Station",style: TextStyle(color: Colors.black),),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: (){
              Get.toNamed(Routes.NOTIFICATIONS);
            } ,
            icon: Image.asset("assets/images/notificationLabel.png",width: 20,),
        )
      ],
    );
  }
}
