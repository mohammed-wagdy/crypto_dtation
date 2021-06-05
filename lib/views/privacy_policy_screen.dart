import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/general_controller.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyAndPolicy extends GetView<GeneralController> {

  GeneralController controller = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "سياسة الخصوصية",
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

              Center(child: Image.asset("assets/images/privacy.png",height: 200,)),

              SizedBox(height: 30,),

              controller.privacyText.value.isEmpty ?
              Center(child: CustomText(
                text: "لا يوجد بيانات",
                textSize: 17,
                textColor: mainColor,
              ),)
                  :
              CustomText(
                text: controller.privacyText.value,
                textSize: 17,
                textColor: mainColor,
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
