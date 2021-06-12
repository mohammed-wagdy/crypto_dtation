import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/widgets/custom_appbar.dart';
import 'package:crypto_station/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeScreen extends GetView<HomeController> {

  HomeController controller = Get.put(HomeController());

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        drawer: customDrawer(),
        body: PersistentTabView(
          context,
          controller: controller.controller,
          screens: controller.pages,
          items: controller.navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: whiteColor, // Default is Colors.white.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 0,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          onItemSelected: (index) {
            controller.currentIndex.value = index;
            controller.controller.index = index;
            controller.changePage(pageIndex: index);
            if(controller.currentIndex.value == 3) {
              Get.put(ProfileController()).getUserData();
              Get.put(ProfileController()).getRates();
              // controller.getHomePageAllOffers();
            }else if(controller.currentIndex.value == 0) {
              Get.put(HomeController()).getHomePageAllOffers();
            }else if(controller.currentIndex.value == 1) {
              Get.put(OffersController()).getMyOffers(user_id: box.read("currentUser")['id'].toString());
            }else if(controller.currentIndex.value == 4) {
              Get.put(FavouriteController()).getFavouriteList();
            }
          },
          screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
        )
    );
  }
}
