import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_listTile.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    image: NetworkImage("https://icon-library.com/images/avatar-icon/avatar-icon-8.jpg"),
                  )
              ),
            ),

            SizedBox(height: 10,),

            CustomText(
              text: "محمد وجدي محمد كمال",
              textTextAlign: TextAlign.center,
              textFontWeight: FontWeight.bold,
              textColor: mainColor,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 0.5,color: Color(0XFF1a4b6b),),
            ),

            CustomListTile(
                onTapFunction: (){
                  Get.back();
                  Get.find<HomeController>().controller.index = 0;
                },
                text: "الرئيسية",
                listIcon: Icon(Icons.home, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){
                  Get.back();
                  Get.find<HomeController>().controller.index = 3;
                },
                text: "حسابي",
                listIcon: Icon(Icons.verified_user,color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){
                  Get.back();
                  Get.find<HomeController>().controller.index = 1;
                },
                text: "عروضي",
                listIcon: Icon(Icons.verified_user,color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){

                },
                text: "صفقاتي",
                listIcon: Icon(Icons.verified_user, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){
                  Get.back();
                  Get.find<HomeController>().controller.index = 4;
                },
                text: "المفضلة",
                listIcon: Icon(Icons.verified_user, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){},
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

            CustomListTile(
                onTapFunction: (){},
                text: "مشاركة التطبيق",
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),

            CustomListTile(
                onTapFunction: (){},
                text: "تسجيل الخروج",
                listIcon: Icon(Icons.add_alert, color: Color(0XFF1a4b6b),)
            ),


          ],
        ),
      ),
    );
  }
}
