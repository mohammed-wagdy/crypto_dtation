import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/notifications_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {

  NotificationsController controller = Get.put(NotificationsController());

  final VoidCallback onTapFunction;
  final String text;
  final Icon? listIcon;
  final Image? listImage;
  final bool isTrailing;
  final bool isImage;

  CustomListTile({
    this.listImage,
    required this.onTapFunction,
    required this.text,
    this.listIcon,
    this.isTrailing = false,
    this.isImage = false
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isImage ? listImage : listIcon,
      onTap: onTapFunction,
      dense: true,

      title: Text(text, style: TextStyle(
        color: Color(0XFF1a4b6b),
        fontSize: 16.0
      ),),
    );
  }
}
