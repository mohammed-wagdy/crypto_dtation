import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/notifications_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {

  NotificationsController controller = Get.put(NotificationsController());

  final VoidCallback onTapFunction;
  final String text;
  final Icon listIcon;
  final bool isTrailing;

  CustomListTile({
    required this.onTapFunction,
    required this.text,
    required this.listIcon,
    this.isTrailing = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: listIcon,
      onTap: onTapFunction,
      dense: true,
      trailing: isTrailing ? Container(
        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 8),
        decoration: BoxDecoration(
          color: Color(0XFFff2a2a),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
        ),
        child: Obx(()=>Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(controller.unreadNotiList.value.length.toString(),style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold),),
        )),
      ) : SizedBox(),
      title: Text(text, style: TextStyle(
        color: Color(0XFF1a4b6b),
        fontSize: 16.0
      ),),
    );
  }
}
