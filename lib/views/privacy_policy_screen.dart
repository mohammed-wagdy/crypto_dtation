import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyAndPolicy extends GetView<HomeController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "سياسة الخصوصية",
            drawerKey: controller.scaffoldKey,
          )),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(child: Image.asset("assets/images/privacy.png",height: 200,)),

              SizedBox(height: 30,),

              CustomText(
                text: "هناك العديد من الأنواع المتوفرة لنصوص لوريم إبسيوم . ولكن الغالبية تم تعديلها بشكل ما يعبر عن إدخال بعض النوادر أو الكلمات العشوائية إلي نص . إن كنت تريد أن تستخدم نص لوريم ابسيوم كل ما عليك ان تتحقق اولا ان ليس هناك أي كلمات أو عبارات محرجه أو غير لائقة مخبأة في هذا النص بينما تعمل جميع مولدات النصوص لوريم أبسيوم علي الأنترنت علي إعادة تكرار مقاطع من نص لوريم أبسيوم نفسه عده مرات هناك العديد من الأنواع المتوفرة لنصوص لوريم إبسيوم . ولكن الغالبية تم تعديلها بشكل ما يعبر عن إدخال بعض النوادر أو الكلمات العشوائية إلي نص . ",
                textSize: 17,
                textColor: mainColor,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
