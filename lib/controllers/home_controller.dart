import 'package:crypto_station/constants.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/models/user.dart';
import 'package:crypto_station/providers/auth_providers.dart';
import 'package:crypto_station/providers/home_providers.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/views/add_offer_screen.dart';
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
  RxList allHomePageOffer = [].obs;
  RxBool orderDone = false.obs;
  RxBool isLoading = false.obs;
  RxList otherUserProfile = [].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
   await getHomePageAllOffers();
    controller = PersistentTabController(initialIndex: currentIndex.value);
  }

  final List<Widget> pages = [
    HomePageScreen(),
    OffersScreen(),
    AddOfferScreen(),
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
  }


  // Get HomePage Offers
  Future getHomePageAllOffers() async {
    isLoading.value = true;
    await HomeProvider().getHomePageAllOffers().then((value) {
      allHomePageOffer.value = value["offer"];
      print("VVVV<VV<V< ${value["offer"][0]['status']}");
    });
    isLoading.value = false;
  }


  // Order Offer
  Future orderOffer({user_id , offer_id}) async {
    isLoading.value = true;
    await HomeProvider().orderOffer(
    user_id: user_id,
      offer_id: offer_id
    ).then((value) {
      print("FOOOOOOOMMMMM ${value}");
      if(value['status'] == 1) {
        Get.back();
        Helper.successSnackBar("جيد", value['message']);
      }
    });
    isLoading.value = false;
  }

}
