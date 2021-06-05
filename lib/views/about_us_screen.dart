import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/general_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends GetView<GeneralController> {


  @override
  Widget build(BuildContext context) {

    GeneralController controller = Get.put(GeneralController());

    return Obx(()=> Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "من نحن",
            drawerContext: context,
          )),
      body:
      controller.isLoading.value ? Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 30,)) :
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(child: Image.network("https://cdn.dribbble.com/users/6623125/screenshots/14841425/crypto_4x.png",height: 200,)),

              SizedBox(height: 30,),

              controller.aboutText.value.isEmpty ?
              Center(child: CustomText(
                text: "لا يوجد بيانات",
                textSize: 17,
                textColor: mainColor,
              ),)
                  :
              CustomText(
                text: controller.aboutText.value,
                textSize: 17,
                textColor: mainColor,
              ),

              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    ));
  }
}
