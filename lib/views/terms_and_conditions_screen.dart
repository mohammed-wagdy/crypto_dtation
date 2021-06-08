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

class TermsAndConditions extends GetView<GeneralController> {

  GeneralController controller = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    controller.getTermsAndConditions();
    return Obx(()=>Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "الشروط والأحكام",
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

              Center(child: Image.asset("assets/images/conditions.png",height: 200,)),

              SizedBox(height: 30,),

              controller.TermsText.value.isEmpty
                  ?
              Center(child: CustomText(
                text: "لا يوجد بيانات",
                textSize: 17,
                textColor: mainColor,
              ),)
                  :
              CustomText(
                text: controller.TermsText.value,
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
