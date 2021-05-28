import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/grid_user_with_status.dart';
import 'package:crypto_station/widgets/list_user_with_status.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends GetView<OffersController> {

  OffersController controller = Get.put(OffersController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SpecialAppBar(
            drawerContext: context,
            appBarTitle: "العروض",
          )),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                controller.selectMyOffers.value == true ?
                // Filter Drop Down
                PopupMenuButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: nameColor),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_rounded,color: nameColor,size: 12,),
                        CustomText(
                          text: "فلترة البحث",
                          textColor: nameColor,
                          textSize: 13,

                        )
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext bc) => [
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض النشطة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "قيد المراجعة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض المنتهية",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض المرفوضة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأحدث",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأقدم",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                  ],
                  onSelected: (val) {
                    print("DKDFKDFKDFKD ${val}");
                    // Note You must create respective pages for navigation
                    //   Navigator.pushNamed(context, route);
                  },
                ) : PopupMenuButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: nameColor),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_rounded,color: nameColor,size: 12,),
                        CustomText(
                          text: "فلترة البحث",
                          textColor: nameColor,
                          textSize: 13,

                        )
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext bc) => [
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض النشطة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض المنتهية",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأحدث",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأقدم",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: ""
                    ),
                  ],
                  onSelected: (val) {
                    print("DKDFKDFKDFKD ${val}");
                    // Note You must create respective pages for navigation
                    //   Navigator.pushNamed(context, route);
                  },
                ),

                SizedBox(width: 3,),
                GestureDetector(
                    onTap: (){
                      controller.isGrid.value = true;
                    },
                    child: Icon(Icons.apps,color: controller.isGrid.value == false ? Colors.grey : nameColor,size: 30,)
                ),
                SizedBox(width: 3,),
                GestureDetector(
                    onTap: (){
                      controller.isGrid.value = false;
                    },
                    child: Icon(Icons.format_list_bulleted_sharp,color: controller.isGrid.value == false ? nameColor : Colors.grey,size: 30,)
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child:  Row(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.selectMyOffers.value = true;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: controller.selectMyOffers.value != false ? nameColor :  grayColor),
                      color: controller.selectMyOffers.value != false ? whiteColor  : Colors.grey.withOpacity(0.2) ,
                    ),
                    child: CustomText(
                      text: "عروضي الخاصة",
                      textFontWeight: FontWeight.bold,
                      textSize: 12,
                      textColor: controller.selectMyOffers.value != false ? nameColor : blackColor,
                    ),
                  )
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    controller.selectMyOffers.value = false;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: controller.selectMyOffers.value == false ? nameColor :  grayColor),
                      color: controller.selectMyOffers.value == false ? whiteColor  : Colors.grey.withOpacity(0.2) ,
                    ),
                    child: CustomText(
                      text: "جميع الصفقات",
                      textSize: 12,
                      textColor: controller.selectMyOffers.value == false ? nameColor : blackColor,
                      textFontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          Expanded(child: controller.isGrid.value == true ? GridUserBlockWithStatus() : ListUserBlockWithStatus()),

          SizedBox(height: 15,),
        ],
      ),
    ));
  }
}
