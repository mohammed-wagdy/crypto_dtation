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

class AboutUs extends GetView<HomeController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "من نحن",
            drawerKey: controller.scaffoldKey,
          )),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(child: Image.network("https://cdn.dribbble.com/users/6623125/screenshots/14841425/crypto_4x.png",height: 200,)),

              SizedBox(height: 30,),

              CustomText(
                text: "هناك العديد من الأنواع المتوفرة لنصوص لوريم إبسيوم . ولكن الغالبية تم تعديلها بشكل ما يعبر عن إدخال بعض النوادر أو الكلمات العشوائية إلي نص . إن كنت تريد أن تستخدم نص لوريم ابسيوم كل ما عليك ان تتحقق اولا ان ليس هناك أي كلمات أو عبارات محرجه أو غير لائقة مخبأة في هذا النص بينما تعمل جميع مولدات النصوص لوريم أبسيوم علي الأنترنت علي إعادة تكرار مقاطع من نص لوريم أبسيوم نفسه عده مرات هناك العديد من الأنواع المتوفرة لنصوص لوريم إبسيوم . ولكن الغالبية تم تعديلها بشكل ما يعبر عن إدخال بعض النوادر أو الكلمات العشوائية إلي نص . ",
                textSize: 17,
                textColor: mainColor,
              ),

              SizedBox(height: 20,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "تابعونا علي",
                    textColor: Colors.grey,
                    textTextAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.facebook,color: Colors.grey,),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.instagram,color: Colors.grey,),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.linkedin,color: Colors.grey,),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.twitter,color: Colors.grey,),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.whatsapp,color: Colors.grey,),
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: Icon(FontAwesomeIcons.youtube,color: Colors.grey,),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
