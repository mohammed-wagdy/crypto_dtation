import 'package:crypto_station/constants.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecialAppBar extends StatelessWidget {

  final BuildContext drawerContext;
  final String appBarTitle;
  final bool noBackPage;

  SpecialAppBar({required this.drawerContext,required this.appBarTitle,this.noBackPage = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Scaffold.of(drawerContext).openDrawer(),
        icon: Image.asset("assets/images/menuIcon2.png",width: 20,),
      ),
      title: Text(appBarTitle,style: TextStyle(height: 1.6),),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: (){
            Get.toNamed(Routes.NOTIFICATIONS);
          } ,
          icon: Image.asset("assets/images/notificationIcon2.png",width: 20,),
        )
      ],
    );
  }
}
