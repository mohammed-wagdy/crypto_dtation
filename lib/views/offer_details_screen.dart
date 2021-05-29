import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OfferDetailsScreen extends GetView<OffersController> {

  OffersController controller = Get.put(OffersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SpecialAppBar(
            drawerContext: context,
            appBarTitle: "بيانات العرض",
          )),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "حالة العرض",
              textColor: textLabelColor,
              textFontWeight: FontWeight.w500,
              textSize: 16.0,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(color: textLabelColor),
                      activeColor: mainColor,
                      onChanged: (val) {
                        //controller.changeRememberMe(val);
                      },
                      value: true,
                    ),
                    CustomText(
                      text: "مطلوب شراء",
                      textColor: textLabelColor,
                      textSize: 14.0,
                      textFontWeight: FontWeight.w500,
                    )
                  ],
                ),
                SizedBox(width: 20,),
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(color: textLabelColor),
                      activeColor: mainColor,
                      onChanged: (val) {
                        //controller.changeRememberMe(val);
                      },
                      value: true,
                    ),
                    CustomText(
                      text: "مطلوب بيع",
                      textColor: textLabelColor,
                      textSize: 14.0,
                      textFontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ],
            ),


            SizedBox(height: 10,),


            CustomTextFormField(
                textLabel: "طريقة الدفع",
                textController: controller.payType,
                keyboardType: TextInputType.text
            ),

            SizedBox(height: 15,),

            Row(
              children: [
                CustomText(
                  text: "البلد",
                  textColor: textLabelColor,
                  textFontWeight: FontWeight.w500,
                  textSize: 16.0,
                ),
                SizedBox(width: 40,),
                Row(
                  children: [
                    Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                    SizedBox(width: 10,),
                    CustomText(
                      text: "مصر",
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15,),


            Row(
              children: [
                CustomText(
                  text: "عمولة الوساطة",
                  textColor: textLabelColor,
                  textFontWeight: FontWeight.w500,
                  textSize: 16.0,
                ),
                SizedBox(width: 40,),
                CustomText(
                  text: "علي المشتري (5%)",
                ),
              ],
            ),

            SizedBox(height: 15,),

            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                      textLabel: "الكمية",
                      textController: controller.payType,
                      keyboardType: TextInputType.number
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CustomTextFormField(
                      textLabel: "أقل كمية",
                      textController: controller.payType,
                      keyboardType: TextInputType.number
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: CustomTextFormField(
                      textLabel: "سعر الصرف",
                      textController: controller.payType,
                      keyboardType: TextInputType.number
                  ),
                ),
              ],
            ),

            SizedBox(height: 15,),


            Row(
              children: [
                CustomText(
                  text: "تاريخ العرض",
                  textColor: textLabelColor,
                  textFontWeight: FontWeight.w500,
                  textSize: 16.0,
                ),
                SizedBox(width: 40,),
                CustomText(
                  text: "15 مايو 2021 ",
                ),
              ],
            ),

            SizedBox(height: 40,),

            Container(
              width: double.infinity,
              child: CustomButton(
                  buttonText: "إضافة",
                  buttonTextFontWeight: FontWeight.w500,
                  buttonOnPress: (){
                    Get.find<HomeController>().controller.index = 0;
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    Get.back();
                                  },
                                  child: Icon(Icons.close,size: 20,color: mainColor,),
                                )
                              ],
                            ),
                            SizedBox(height: 15,),
                            Image.asset("assets/images/rightIcon.PNG",width: 50,),
                            SizedBox(height: 15,),
                            CustomText(
                              text: "تم إضافة العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                              textFontWeight: FontWeight.w500,
                              textColor: mainColor,
                              textSize: 18.0,
                            ),
                            SizedBox(height: 15,),
                            Container(
                              width: double.infinity,
                              child:
                              CustomButton(
                                buttonText: "إضافة عرض جديد",
                                buttonOnPress: () {
                                  Get.find<HomeController>().controller.index = 2;
                                  Get.back();
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    });
                    // Get.defaultDialog(
                    //   title: "",
                    //     content: Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.end,
                    //             children: [
                    //              GestureDetector(
                    //                onTap:(){
                    //                 Get.back();
                    //     },
                    //                child: Icon(Icons.close,size: 20,color: mainColor,),
                    //              )
                    //             ],
                    //           ),
                    //           SizedBox(height: 15,),
                    //           Image.asset("assets/images/rightIcon.PNG",width: 50,),
                    //         SizedBox(height: 15,),
                    //           CustomText(
                    //             text: "تم إضافة العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                    //             textFontWeight: FontWeight.w500,
                    //             textColor: mainColor,
                    //             textSize: 17.0,
                    //           ),
                    //           SizedBox(height: 15,),
                    //           Container(
                    //             width: double.infinity,
                    //             child:
                    //             CustomButton(
                    //               buttonText: "إضافة عرض جديد",
                    //               buttonOnPress: () {
                    //
                    //               },
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     )
                    // );
                  }),
            )

          ],
        ),
      ),
    );
  }
}
