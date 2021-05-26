import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomDarkAppBar(
              noBackPage: true,
              appBarTitle: "نتائج البحث",
              drawerContext: context,
            )),
        body: GridUserBlock(),
    );
  }
}
