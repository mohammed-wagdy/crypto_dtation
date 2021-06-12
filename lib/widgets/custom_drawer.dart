import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_listTile.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class customDrawer extends StatelessWidget {

  GetStorage box = GetStorage();
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var user = box.read("currentUser");
    print("OFOFPPOO ${user['image']}");
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: ListView(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image:
                    user['image'] == null || user['image'] == "user.png" ?
                    NetworkImage("https://www.pngjoy.com/pngm/136/2750635_gray-circle-login-user-icon-png-transparent-png.png") :
                    NetworkImage("${user['image']}")
                  )
              ),
            ),

            SizedBox(height: 10,),

            CustomText(
              text: user['full_name'],
              textTextAlign: TextAlign.center,
              textFontWeight: FontWeight.bold,
              textColor: mainColor,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 0.5,color: Color(0XFF1a4b6b),),
            ),

            CustomListTile(
                onTapFunction: () async{
                  Get.back();
                  Get.find<HomeController>().controller.index = 0;
                await  Get.put(HomeController()).getHomePageAllOffers();
                },
                text: "الرئيسية",
                listIcon: Icon(Icons.home, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: () async {
                   Get.back();
                    Get.find<HomeController>().controller.index = 3;
                    await Get.put(ProfileController()).getUserData();
                    await  Get.put(ProfileController()).getRates();
                },
                text: "حسابي",
                listIcon: Icon(Icons.verified_user,color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: () async{
                  Get.back();
                  Get.find<HomeController>().controller.index = 1;
                  await Get.put(OffersController()).getMyOffers(user_id: box.read("currentUser")['id'].toString());
                },
                text: "عروضي",
                listIcon: Icon(Icons.verified_user,color: Color(0XFF1a4b6b),)
            ),

            // CustomListTile(
            //     onTapFunction: (){
            //
            //     },
            //     text: "صفقاتي",
            //     listIcon: Icon(Icons.verified_user, color: Color(0XFF1a4b6b),)
            // ),

            CustomListTile(
                onTapFunction: () async{
                  Get.back();
                  Get.find<HomeController>().controller.index = 4;
                  await Get.put(FavouriteController()).getFavouriteList();
                },
                text: "المفضلة",
                listIcon: Icon(Icons.verified_user, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){
                  Get.toNamed(Routes.ADVANCED_SEARCH);
                },
                text: "بحث متقدم",
                listIcon: Icon(Icons.search, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){
                  Get.toNamed(Routes.NOTIFICATIONS);
                },
                text: "التنبيهات",
                isTrailing: true,
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 0.5,color: Color(0XFF1a4b6b),),
            ),


            CustomListTile(
                onTapFunction: (){
                  Get.toNamed(Routes.CONTACT);
                },
                text: "تواصل معنا",
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),


            CustomListTile(
                onTapFunction: (){
                  Get.toNamed(Routes.ABOUT);
                },
                text: "من نحن",
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),


            CustomListTile(
                onTapFunction: (){
                  Get.toNamed(Routes.TERMS);
                },
                text: "الشروط والأحكام",
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){
                  Get.toNamed(Routes.PRIVACY);
                },
                text: "سياسة الخصوصية",
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),

            // CustomListTile(
            //     onTapFunction: (){},
            //     text: "مشاركة التطبيق",
            //     listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            // ),

            CustomListTile(
                onTapFunction: (){
                  GetStorage box = GetStorage();
                  box.remove("access_token");
                  Get.offAllNamed(Routes.LOGIN);
                },
                text: "تسجيل الخروج",
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),


          ],
        ),
      ),
    );
  }
}
