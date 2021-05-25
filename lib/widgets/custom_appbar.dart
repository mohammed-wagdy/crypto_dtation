import 'package:crypto_station/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {

  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBar({required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Image.asset("assets/images/menu_icon.png",width: 20,),
      ),
      title: Text("Crypto Station"),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: (){} ,
            icon: Image.asset("assets/images/notificationLabel.png",width: 20,),
        )
      ],
    );
  }
}
