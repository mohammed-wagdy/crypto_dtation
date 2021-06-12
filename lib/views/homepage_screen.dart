import 'dart:math';

import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_appbar.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:crypto_station/widgets/grid_user_with_status.dart';
import 'package:crypto_station/widgets/list_user_block.dart';
import 'package:crypto_station/widgets/list_user_with_status.dart';
import 'package:crypto_station/widgets/slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// class RandomColorModel {
//
//   Random random = Random();
//   Color getColor() {
//     return Color.fromARGB(random.nextInt(300), random.nextInt(300),
//         random.nextInt(300), random.nextInt(300));
//   }
// }

class HomePageScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {

    GetStorage _box = GetStorage();
    HomeController homController = Get.put(HomeController());
    FavouriteController favController = Get.put(FavouriteController());
    // print("DDDDDDDDDDDDDDDDD ${controller.allHomePageOffer.value['fav']}");

    return Obx(() => controller.isLoading.value
        ? Center(
            child: Image.asset(
              "assets/images/ajaxLoader.gif",
              width: 30,
            ),
          )
        : Scaffold(
            //key: controller.scaffoldKey,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: CustomAppBar(
                  drawerContext: context,
                )),
            backgroundColor: whiteColor,
            body: Column(children: [
              // Slider
              CarouselSlider(
                  items: [
                    SliderWidget(
                      titleName: "العروض الخاصة",
                      count: controller.specialOfferCount.value,
                      changeColor: true,
                      onTapFunc: () {
                        Get.toNamed(Routes.SHOW_OFFERS_FROM_HOMEPAGE);
                      },
                    ),
                    SliderWidget(
                      titleName: "العروض المنتهية",
                      count: controller.finishedOfferCount.value,
                      onTapFunc: () {
                        Get.toNamed(Routes.SHOW_OFFERS_FROM_HOMEPAGE_FINISHED);
                      },
                    ),
                    SliderWidget(
                      titleName: "العروض قيد المراجعة",
                      count: controller.pendingOfferCount.value,
                      onTapFunc: () {
                        Get.toNamed(Routes.SHOW_OFFERS_FROM_HOMEPAGE_PENDING);
                      },
                    ),
                  ],
                  options: CarouselOptions(
                    height: 155,
                    // aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    //onPageChanged: callbackFunction,
                    // scrollDirection: Axis.horizontal,
                  )),

              // Grid Of Users

              controller.allHomePageOffer.value.isEmpty ? Center(child: Text("لا يوجد عروض",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),) :
              Expanded(
                  // child: ListUserBlockWithStatus()
                  child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: WaterDropHeader(),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus? mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("أسحب للتحميل");
                    } else if (mode == LoadStatus.loading) {
                      body = Text("تحميل المزيد");
                    } else if (mode == LoadStatus.failed) {
                      body = Text("Load Failed!Click retry!");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("release to load more");
                    } else {
                      body = Text("لا يوجد بيانات أخري");
                    }
                    return Container(
                        height: 55.0,
                        child: Center(
                          child: body,
                        ));
                  },
                ),
                controller: controller.refreshController,
                onRefresh: controller.onRefresh,
                onLoading: controller.onLoading,
                child:
                GridView.builder(
                        itemCount: controller.allHomePageOffer.value.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 4.2),
                        ),
                        itemBuilder: (context,index) {
                          DateTime dateTime = DateTime.parse(controller.allHomePageOffer.value[index]["created_at"],);
                          String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
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
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    // User Image
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: grayColor),
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.allHomePageOffer.value[index]["user"]["image"]}"),
                                          )
                                      ),
                                    ),

                                    SizedBox(width: 10,),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          // Name and Favourite
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: (){
                                                    Get.toNamed(Routes.OTHER_USER_PROFILE , arguments: controller.allHomePageOffer.value[index]["user"]["id"].toString());
                                                  },
                                                  child: CustomText(
                                                    userName: true,
                                                    text: controller.allHomePageOffer.value[index]["user"]["full_name"],
                                                    textColor: nameColor,
                                                    textSize: 18.0,
                                                    textFontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),

                                              controller.allHomePageOffer.value[index]["fav"].isEmpty ?
                                              GestureDetector(
                                                onTap: () {
                                                  favController.addToFavourite(offer_id: controller.allHomePageOffer.value[index]['id'].toString());
                                                },
                                                child: Icon(Icons.favorite_border_outlined,color: Colors.grey,),
                                              )
                                                  :
                                              GestureDetector(
                                                onTap: () {
                                                  favController.deleteFromFavourite(offer_id: controller.allHomePageOffer.value[index]['id'].toString());
                                                },
                                                child: Icon(Icons.favorite,color: favouriteColor,),
                                              )
                                            ],
                                          ),

                                          SizedBox(height: 5,),

                                          // Rating and flag
                                          Row(
                                            children: [
                                              Row(
                                                children: Helper.getStarsList(double.parse(controller.allHomePageOffer.value[index]["user"]["rate"])),),
                                              SizedBox(width: 20,),
                                              //
                                              Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.allHomePageOffer.value[index]["country"]['image']}",width: 20,),
                                            ],
                                          )

                                        ],
                                      ),
                                    )
                                  ],
                                ),

                                SizedBox(height: 5,),

                                Row(
                                  children: [

                                    // Date
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/dateIcon.png',width: 15,),
                                        SizedBox(width: 5,),
                                        CustomText(
                                          text: offerDate,
                                          textSize: 17,
                                          textColor: grayColor,
                                        )
                                      ],
                                    ),

                                    SizedBox(width: 30,),

                                    // Price
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/images/priceIcon.png",width: 15,),
                                        SizedBox(width: 5,),
                                        CustomText(
                                          text: "سعر الصرف:",
                                          textSize: 17,
                                          textColor: grayColor,
                                        ),
                                        SizedBox(width: 5,),
                                        CustomText(
                                          text: controller.allHomePageOffer.value[index]["pay_price"],
                                          textColor: nameColor,
                                          textFontWeight: FontWeight.w600,
                                          textSize: 18,
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                SizedBox(height: 5,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset("assets/images/quantityIcon.png",width: 20,),
                                        SizedBox(width: 5,),
                                        CustomText(
                                          text: "الكمية",
                                          textColor: grayColor,
                                          textSize: 17,
                                        ),
                                        SizedBox(width: 20,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            CustomText(
                                              text: "USDT",
                                              textColor: grayColor,
                                              textSize: 14,
                                            ),
                                            SizedBox(width: 3,),
                                            CustomText(
                                              text: controller.allHomePageOffer.value[index]["quantity"],
                                              textColor: nameColor,
                                              textSize: 35,
                                              textFontWeight: FontWeight.bold,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.bottomSheet(
                                            Container(
                                                color: whiteColor,
                                                padding: EdgeInsets.all(10.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // User Image
                                                          Container(
                                                            width: 60,
                                                            height: 60,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(color: grayColor),
                                                                shape: BoxShape.circle,
                                                                image: DecorationImage(
                                                                  fit:BoxFit.cover,
                                                                  image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.allHomePageOffer.value[index]["user"]["image"]}"),
                                                                )
                                                            ),
                                                          ),

                                                          SizedBox(width: 10,),

                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [

                                                                // Name and Favourite
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                  children: [
                                                                    Expanded(
                                                                      child: CustomText(
                                                                        userName: true,
                                                                        text: controller.allHomePageOffer.value[index]["user"]["full_name"],
                                                                        textColor: nameColor,
                                                                        textSize: 18.0,
                                                                        textFontWeight: FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),

                                                                SizedBox(height: 5,),

                                                                // Rating and flag
                                                                Row(
                                                                  children: [
                                                                    Row(
                                                                      children: Helper.getStarsList(double.parse(controller.allHomePageOffer.value[index]["user"]["rate"])),),
                                                                    SizedBox(width: 20,),
                                                                    Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.allHomePageOffer.value[index]["country"]['image']}",width: 20,),
                                                                  ],
                                                                )

                                                              ],
                                                            ),
                                                          ),

                                                          Container(
                                                            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                                                            decoration: BoxDecoration(
                                                                color: grayColor,
                                                                borderRadius: BorderRadius.all(Radius.circular(3.0))
                                                            ),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Icon(
                                                                    Icons.circle,size: 10.0,
                                                                    color:
                                                                    controller.allHomePageOffer.value[index]["status"].toString() == "pending" ? Colors.orange :
                                                                    controller.allHomePageOffer.value[index]["status"].toString() == "rejected"  ? redColor :
                                                                    controller.allHomePageOffer.value[index]["status"].toString() == "finished" ? redColor :
                                                                    controller.allHomePageOffer.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                                ),
                                                                SizedBox(width: 3,),
                                                                CustomText(
                                                                  text:
                                                                  controller.allHomePageOffer.value[index]["status"].toString() == "pending" ? "معلق" :
                                                                  controller.allHomePageOffer.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                                                  controller.allHomePageOffer.value[index]["status"].toString() == "finished" ? "منتهي" :
                                                                  controller.allHomePageOffer.value[index]["status"].toString() == "accepted" ? "نشط" : "",
                                                                  textSize: 13.0,
                                                                  textColor: whiteColor,
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex:1,
                                                            child: CustomText(
                                                              text: "رقم العرض",
                                                              textColor: Colors.grey,
                                                              textFontWeight: FontWeight.bold,
                                                              textSize: 14.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: CustomText(
                                                              text: controller.allHomePageOffer.value[index]["id"].toString(),
                                                              textColor: nameColor,
                                                              textFontWeight: FontWeight.w500,
                                                              textSize: 14.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex:1,
                                                            child: CustomText(
                                                              text: "حالة العرض",
                                                              textColor: Colors.grey,
                                                              textFontWeight: FontWeight.bold,
                                                              textSize: 14.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: CustomText(
                                                              text: controller.allHomePageOffer.value[index]["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
                                                              textColor: nameColor,
                                                              textFontWeight: FontWeight.w500,
                                                              textSize: 14.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex:1,
                                                            child: CustomText(
                                                              text: "نوع العملة",
                                                              textColor: Colors.grey,
                                                              textFontWeight: FontWeight.bold,
                                                              textSize: 14.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: CustomText(
                                                              text: controller.allHomePageOffer.value[index]["currency_type"].toString(),
                                                              textColor: nameColor,
                                                              textFontWeight: FontWeight.w500,
                                                              textSize: 14.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: CustomText(
                                                              text: "طريقة الدفع",
                                                              textColor: Colors.grey,
                                                              textFontWeight: FontWeight.bold,
                                                              textSize: 14.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: CustomText(
                                                              text: controller.allHomePageOffer.value[index]["payment_type"].toString(),
                                                              textColor: nameColor,
                                                              textFontWeight: FontWeight.w500,
                                                              textSize: 14.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex:1,
                                                            child: CustomText(
                                                              text: "البلد",
                                                              textColor: Colors.grey,
                                                              textFontWeight: FontWeight.bold,
                                                              textSize: 14.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex:2,
                                                            child: Row(
                                                              children: [
                                                                Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.allHomePageOffer.value[index]["country"]['image']}",width: 20,),
                                                                SizedBox(width: 10,),
                                                                CustomText(
                                                                  text: controller.allHomePageOffer.value[index]["country"]['name'],
                                                                  textColor: nameColor,
                                                                  textFontWeight: FontWeight.w500,
                                                                  textSize: 14.0,
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            flex:1,
                                                            child: CustomText(
                                                              text: "عمولة الوساطة",
                                                              textColor: Colors.grey,
                                                              textFontWeight: FontWeight.bold,
                                                              textSize: 14.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: CustomText(
                                                              text: "علي المشتري (${controller.allHomePageOffer.value[index]["percent"].toString()})",
                                                              textColor: nameColor,
                                                              textFontWeight: FontWeight.w500,
                                                              textSize: 14.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: CustomTextFormField(
                                                                textLabel: "الكمية",
                                                                isInitialValue: true,
                                                                initVal: controller.allHomePageOffer.value[index]["quantity"].toString(),
                                                                // textController: payType,
                                                                keyboardType: TextInputType.number
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Expanded(
                                                            child: CustomTextFormField(
                                                                isInitialValue: true,
                                                                initVal: controller.allHomePageOffer.value[index]["low_quantity"].toString(),
                                                                textLabel: "أقل كمية",
                                                                // textController: payType,
                                                                keyboardType: TextInputType.number
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,),
                                                          Expanded(
                                                            child: CustomTextFormField(
                                                                textLabel: "سعر الصرف",
                                                                isInitialValue: true,
                                                                initVal: controller.allHomePageOffer.value[index]["pay_price"].toString(),
                                                                //  textController: payType,
                                                                keyboardType: TextInputType.number
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: CustomText(
                                                              text: " تاريخ العرض",
                                                              textColor: Colors.grey,
                                                              textFontWeight: FontWeight.bold,
                                                              textSize: 14.0,
                                                            ),
                                                            flex: 1,
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: CustomText(
                                                              text: offerDate,
                                                              textColor: nameColor,
                                                              textFontWeight: FontWeight.w500,
                                                              textSize: 14.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 10,),

                                                      Obx(() =>homController.isLoading.value ?
                                                      Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 250,),) :
                                                      // When Click On مشاهدة العرض
                                                      Container(
                                                        width: double.infinity,
                                                        child:
                                                        controller.allHomePageOffer.value[index]["user"]["id"] != _box.read("currentUser")['id'] &&
                                                            controller.allHomePageOffer.value[index]['status'] == "accepted" ?

                                                        CustomButton(
                                                          buttonText: "طلب العرض",
                                                          buttonOnPress: () {

                                                            // Order Offer
                                                            homController.orderOffer(user_id: _box.read("currentUser")['id'].toString(),offer_id: controller.allHomePageOffer.value[index]["id"].toString());


                                                          },
                                                        ) : SizedBox(),
                                                      ))

                                                    ],
                                                  ),
                                                )
                                            )
                                        );
                                      },
                                      child: CustomText(
                                        text: "المزيد",
                                        textColor: nameColor,
                                        textFontWeight: FontWeight.bold,
                                        textSize: 16,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
              )),

              SizedBox(
                height: 15,
              ),
            ]),
          ));
  }
}
