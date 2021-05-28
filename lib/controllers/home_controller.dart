import 'package:crypto_station/constants.dart';
import 'package:crypto_station/views/favourite_screen.dart';
import 'package:crypto_station/views/homepage_screen.dart';
import 'package:crypto_station/views/offers_screen.dart';
import 'package:crypto_station/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  PersistentTabController controller = PersistentTabController();
  TextEditingController searchInput = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    controller = PersistentTabController(initialIndex: currentIndex.value);
  }

  final List<Widget> pages = [
    HomePageScreen(),
    OffersScreen(),
    Text("إضافة عرض"),
    ProfileScreen(),
    FavouriteScreen(),
  ];

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          icon: Icon(Icons.home),
          title: ("الرئيسية"),
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          icon: Icon(Icons.settings),
          title: ("العروض"),
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          title: ("إضافة عرض"),
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          icon: Icon(Icons.settings),
          title: ("حسابي"),
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
          textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          icon: Icon(Icons.home),
          title: ("المفضلة"),
          activeColorPrimary: mainColor,
          inactiveColorPrimary: Colors.grey),
    ];
  }

  void changePage({pageIndex}) {
    currentIndex.value = pageIndex;

    print("FODOFDOF ${pageIndex}");
    print("FODOFDOF ${currentIndex.value}");
  }
}
