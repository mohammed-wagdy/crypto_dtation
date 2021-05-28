import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:crypto_station/widgets/grid_user_with_status.dart';
import 'package:crypto_station/widgets/list_user_block.dart';
import 'package:crypto_station/widgets/list_user_with_status.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends GetView<FavouriteController> {

  FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SpecialAppBar(
            drawerContext: context,
            appBarTitle: "المفضلات",
          )),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // Filter Drop Down
                PopupMenuButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: nameColor),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_rounded,color: nameColor,),
                        CustomText(
                          text: "فلترة البحث",
                          textColor: nameColor,

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
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                          controller.isGrid.value = true;
                        },
                        icon: Icon(Icons.apps,color: controller.isGrid.value == false ? Colors.grey : nameColor,size: 30,)
                    ),
                    IconButton(
                        onPressed: (){
                          controller.isGrid.value = false;
                        },
                        icon: Icon(Icons.format_list_bulleted_sharp,color: controller.isGrid.value == false ? nameColor : Colors.grey,size: 30,)
                    )
                  ],
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
