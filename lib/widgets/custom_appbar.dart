import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {

  final GlobalKey<ScaffoldState> drawerKey;

  CustomAppBar({required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(Icons.email),
      ),
    );
  }
}
