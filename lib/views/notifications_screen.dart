import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<HomeController> {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "التنبيهات",
            drawerKey: controller.scaffoldKey,
          )),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context , int index) {
          return Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      // color: Theme.of(context).focusColor.withOpacity(0.2),
                      offset: Offset(0, 0),
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 7,
                    )
                  ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage("https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
                            )
                        ),
                      ),

                      SizedBox(width: 10,),

                      Expanded(
                        child: CustomText(
                          text: "تم إضافة العرض الخاص بك وهو الأن قيد المراجعة من قبل الإدارة وسيتم إرسال بريد ألكتروني عند الموافقة علي العرض او يمكنك متابعة التطبيق",
                          textColor: Colors.grey,
                          textSize: 13.0,
                          textFontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    color: grayColor,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/dateIcon.png',width: 15,),
                          SizedBox(width: 5,),
                          CustomText(
                            text: "5 مايو 2021 الساعة 10:22 صباحا",
                            textSize: 12,
                            textColor: grayColor,
                          )
                        ],
                      ),

                      // GestureDetector(
                      //   onTap: (){},
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.done,size: 13,color: Colors.grey,),
                      //       SizedBox(width: 2,),
                      //       CustomText(
                      //         textSize: 12,
                      //         textColor: Colors.grey,
                      //         text: "تمت القراءة",
                      //       )
                      //     ],
                      //   ),
                      // )

                      GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: [
                            Icon(Icons.done,size: 13,),
                            SizedBox(width: 2,),
                            CustomText(
                              textSize: 12,
                              textColor: mainColor,
                              text: "تعليم كمقروء",
                            )
                          ],
                        ),
                      )

                    ],
                  )

                ],
              )
          );
        },
      )
    );
  }
}
