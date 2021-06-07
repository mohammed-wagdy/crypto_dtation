import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:crypto_station/widgets/grid_user_block_fav.dart';
import 'package:crypto_station/widgets/grid_user_with_status.dart';
import 'package:crypto_station/widgets/list_user_block.dart';
import 'package:crypto_station/widgets/list_user_block_fav.dart';
import 'package:crypto_station/widgets/list_user_with_status.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends GetView<FavouriteController> {

  FavouriteController controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return


      Obx(() => Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SpecialAppBar(
            drawerContext: context,
            appBarTitle: "المفضلات",
          )),
      body:

      controller.isLoading.value ?
      Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 30,),)

          :
      Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Row(
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

          controller.favList.value.isEmpty ?
          Center(child: CustomText(
            text: "لا يوجد بيانات",
            textSize: 17,
            textColor: mainColor,
          ),)
              :
          Expanded(
              child: controller.isGrid.value == true ?
              GridUserBlockWithStatusFav(listOffersFiltered: controller.favList,) :
              ListUserBlockWithStatusFav(listOffersFiltered: controller.favList)
          ),

          SizedBox(height: 15,),
        ],
      ),
    ));
  }
}
