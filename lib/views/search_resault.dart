import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../helper.dart';

class SearchResultScreen extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    final isTablet = Tools.isTablet(MediaQuery.of(context));
    final smallScreen = MediaQuery.of(context).size.width < 410;
    GetStorage _box = GetStorage();
    HomeController homController = Get.put(HomeController());
    FavouriteController favController = Get.put(FavouriteController());
    print("VDDSDD ${Get.arguments}");
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomDarkAppBar(
              noBackPage: true,
              appBarTitle: "نتائج البحث",
              drawerContext: context,
            )),
        body:
        // GridUserBlock(listOffers: Get.arguments,),

        Get.arguments.isEmpty ? Center(child: Text("لا يوجد عروض",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),) :

        GridView.builder(
          itemCount: Get.arguments.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio:
            MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 4.2),
          ),
          itemBuilder: (context,index) {
            DateTime dateTime = DateTime.parse(Get.arguments[index]["created_at"],);
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
                              image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${Get.arguments[index]["user"]["image"]}"),
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
                                      Get.toNamed(Routes.OTHER_USER_PROFILE , arguments: Get.arguments[index]["user"]["id"].toString());
                                    },
                                    child: CustomText(
                                      userName: true,
                                      text: Get.arguments[index]["user"]["full_name"],
                                      textColor: nameColor,
                                      textSize: 18.0,
                                      textFontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                Get.arguments[index]["fav"].isEmpty ?
                                GestureDetector(
                                  onTap: () {
                                    favController.addToFavourite(offer_id: Get.arguments[index]['id'].toString());
                                  },
                                  child: Icon(Icons.favorite_border_outlined,color: Colors.grey,),
                                )
                                    :
                                GestureDetector(
                                  onTap: () {
                                    favController.deleteFromFavourite(offer_id: Get.arguments[index]['id'].toString());
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
                                  children: Helper.getStarsList(double.parse(Get.arguments[index]["user"]["rate"])),),
                                SizedBox(width: 20,),
                                //
                                Image.network("http://crypto.supersoftdemo.com/public/image/country/${Get.arguments[index]["country"]['image']}",width: 20,),
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
                            text: Get.arguments[index]["pay_price"],
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
                                text: Get.arguments[index]["quantity"],
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
                                                    image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${Get.arguments[index]["user"]["image"]}"),
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
                                                          text: Get.arguments[index]["user"]["full_name"],
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
                                                        children: Helper.getStarsList(double.parse(Get.arguments[index]["user"]["rate"])),),
                                                      SizedBox(width: 20,),
                                                      Image.network("http://crypto.supersoftdemo.com/public/image/country/${Get.arguments[index]["country"]['image']}",width: 20,),
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
                                                      Get.arguments[index]["status"].toString() == "pending" ? Colors.orange :
                                                      Get.arguments[index]["status"].toString() == "rejected"  ? redColor :
                                                      Get.arguments[index]["status"].toString() == "finished" ? redColor :
                                                      Get.arguments[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                  ),
                                                  SizedBox(width: 3,),
                                                  CustomText(
                                                    text:
                                                    Get.arguments[index]["status"].toString() == "pending" ? "معلق" :
                                                    Get.arguments[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                                    Get.arguments[index]["status"].toString() == "finished" ? "منتهي" :
                                                    Get.arguments[index]["status"].toString() == "accepted" ? "نشط" : "",
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
                                                text: Get.arguments[index]["id"].toString(),
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
                                                text: Get.arguments[index]["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
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
                                                text: Get.arguments[index]["currency_type"].toString(),
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
                                                text: Get.arguments[index]["payment_type"].toString(),
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
                                                  Image.network("http://crypto.supersoftdemo.com/public/image/country/${Get.arguments[index]["country"]['image']}",width: 20,),
                                                  SizedBox(width: 10,),
                                                  CustomText(
                                                    text: Get.arguments[index]["country"]['name'],
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
                                                text: "علي المشتري (${Get.arguments[index]["percent"].toString()})",
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
                                                  initVal: Get.arguments[index]["quantity"].toString(),
                                                  // textController: payType,
                                                  keyboardType: TextInputType.number
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: CustomTextFormField(
                                                  isInitialValue: true,
                                                  initVal: Get.arguments[index]["low_quantity"].toString(),
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
                                                  initVal: Get.arguments[index]["pay_price"].toString(),
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
                                          Get.arguments[index]["user"]["id"] != _box.read("currentUser")['id'] &&
                                              Get.arguments[index]['status'] == "accepted" ?

                                          CustomButton(
                                            buttonText: "طلب العرض",
                                            buttonOnPress: () {

                                              // Order Offer
                                              homController.orderOffer(user_id: _box.read("currentUser")['id'].toString(),offer_id: Get.arguments[index]["id"].toString());

                                              //  homController.orderDone.value ?
                                              //   Get.back();
                                              //   showDialog(context: context, builder: (context) {
                                              //     return AlertDialog(
                                              //       content: Column(
                                              //         mainAxisSize: MainAxisSize.min,
                                              //         crossAxisAlignment: CrossAxisAlignment.center,
                                              //         children: [
                                              //           Row(
                                              //             mainAxisAlignment: MainAxisAlignment.end,
                                              //             children: [
                                              //               GestureDetector(
                                              //                 onTap:(){
                                              //                   Get.back();
                                              //                 },
                                              //                 child: Icon(Icons.close,size: 20,color: mainColor,),
                                              //               )
                                              //             ],
                                              //           ),
                                              //           SizedBox(height: 15,),
                                              //           Image.asset("assets/images/rightIcon.PNG",width: 50,),
                                              //           SizedBox(height: 15,),
                                              //           CustomText(
                                              //             text: "تم طلب العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                                              //             textFontWeight: FontWeight.w500,
                                              //             textColor: mainColor,
                                              //             textSize: 18.0,
                                              //           ),
                                              //           SizedBox(height: 15,),
                                              //           Container(
                                              //             width: double.infinity,
                                              //             child:
                                              //             CustomButton(
                                              //               buttonText: "مشاهدة العرض",
                                              //               buttonOnPress: () {
                                              //                 Get.back();
                                              //                 Get.bottomSheet(
                                              //                     Container(
                                              //                         color: whiteColor,
                                              //                         padding: EdgeInsets.all(10.0),
                                              //                         child: Column(
                                              //                           children: [
                                              //                             Row(
                                              //                               children: [
                                              //                                 // User Image
                                              //                                 Container(
                                              //                                   width: 60,
                                              //                                   height: 60,
                                              //                                   decoration: BoxDecoration(
                                              //                                       border: Border.all(color: grayColor),
                                              //                                       shape: BoxShape.circle,
                                              //                                       image: DecorationImage(
                                              //                                         image: NetworkImage("https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
                                              //                                       )
                                              //                                   ),
                                              //                                 ),
                                              //
                                              //                                 SizedBox(width: 10,),
                                              //
                                              //                                 Expanded(
                                              //                                   child: Column(
                                              //                                     crossAxisAlignment: CrossAxisAlignment.start,
                                              //                                     children: [
                                              //
                                              //                                       // Name and Favourite
                                              //                                       Row(
                                              //                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //                                         // crossAxisAlignment: CrossAxisAlignment.stretch,
                                              //                                         children: [
                                              //                                           Expanded(
                                              //                                             child: CustomText(
                                              //                                               userName: true,
                                              //                                               text: " محمد وجدي محمد ",
                                              //                                               textColor: nameColor,
                                              //                                               textSize: 18.0,
                                              //                                               textFontWeight: FontWeight.bold,
                                              //                                             ),
                                              //                                           ),
                                              //                                         ],
                                              //                                       ),
                                              //
                                              //                                       SizedBox(height: 5,),
                                              //
                                              //                                       // Rating and flag
                                              //                                       Row(
                                              //                                         children: [
                                              //                                           Row(
                                              //                                             children: Helper.getStarsList(2.5),),
                                              //                                           SizedBox(width: 20,),
                                              //                                           Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                                              //                                         ],
                                              //                                       )
                                              //
                                              //                                     ],
                                              //                                   ),
                                              //                                 ),
                                              //
                                              //                                 Container(
                                              //                                   padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                                              //                                   decoration: BoxDecoration(
                                              //                                       color: grayColor,
                                              //                                       borderRadius: BorderRadius.all(Radius.circular(3.0))
                                              //                                   ),
                                              //                                   child: Row(
                                              //                                     mainAxisSize: MainAxisSize.min,
                                              //                                     children: [
                                              //                                       Icon(Icons.circle,size: 10.0, color: redColor,),
                                              //                                       SizedBox(width: 3,),
                                              //                                       CustomText(
                                              //                                         text: "منتهي",
                                              //                                         textSize: 13.0,
                                              //                                         textColor: whiteColor,
                                              //                                       )
                                              //                                     ],
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   flex:1,
                                              //                                   child: CustomText(
                                              //                                     text: "رقم العرض",
                                              //                                     textColor: Colors.grey,
                                              //                                     textFontWeight: FontWeight.bold,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 ),
                                              //                                 Expanded(
                                              //                                   flex: 2,
                                              //                                   child: CustomText(
                                              //                                     text: "521458",
                                              //                                     textColor: nameColor,
                                              //                                     textFontWeight: FontWeight.w500,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   flex:1,
                                              //                                   child: CustomText(
                                              //                                     text: "حالة العرض",
                                              //                                     textColor: Colors.grey,
                                              //                                     textFontWeight: FontWeight.bold,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 ),
                                              //                                 Expanded(
                                              //                                   flex: 2,
                                              //                                   child: CustomText(
                                              //                                     text: "مطلوب للبيع",
                                              //                                     textColor: nameColor,
                                              //                                     textFontWeight: FontWeight.w500,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   flex:1,
                                              //                                   child: CustomText(
                                              //                                     text: "نوع العملة",
                                              //                                     textColor: Colors.grey,
                                              //                                     textFontWeight: FontWeight.bold,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 ),
                                              //                                 Expanded(
                                              //                                   flex: 2,
                                              //                                   child: CustomText(
                                              //                                     text: "USDT",
                                              //                                     textColor: nameColor,
                                              //                                     textFontWeight: FontWeight.w500,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   flex: 1,
                                              //                                   child: CustomText(
                                              //                                     text: "طريقة الدفع",
                                              //                                     textColor: Colors.grey,
                                              //                                     textFontWeight: FontWeight.bold,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 ),
                                              //                                 Expanded(
                                              //                                   flex: 2,
                                              //                                   child: CustomText(
                                              //                                     text: "البنك العربي الأفريقي",
                                              //                                     textColor: nameColor,
                                              //                                     textFontWeight: FontWeight.w500,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   flex:1,
                                              //                                   child: CustomText(
                                              //                                     text: "البلد",
                                              //                                     textColor: Colors.grey,
                                              //                                     textFontWeight: FontWeight.bold,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 ),
                                              //                                 Expanded(
                                              //                                   flex:2,
                                              //                                   child: Row(
                                              //                                     children: [
                                              //                                       Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                                              //                                       SizedBox(width: 10,),
                                              //                                       CustomText(
                                              //                                         text: "مصر",
                                              //                                         textColor: nameColor,
                                              //                                         textFontWeight: FontWeight.w500,
                                              //                                         textSize: 14.0,
                                              //                                       ),
                                              //                                     ],
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   flex:1,
                                              //                                   child: CustomText(
                                              //                                     text: "عمولة الوساطة",
                                              //                                     textColor: Colors.grey,
                                              //                                     textFontWeight: FontWeight.bold,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 ),
                                              //                                 Expanded(
                                              //                                   flex: 2,
                                              //                                   child: CustomText(
                                              //                                     text: "علي المشتري (5%)",
                                              //                                     textColor: nameColor,
                                              //                                     textFontWeight: FontWeight.w500,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   child: CustomTextFormField(
                                              //                                       textLabel: "الكمية",
                                              //                                       textController: payType,
                                              //                                       keyboardType: TextInputType.number
                                              //                                   ),
                                              //                                 ),
                                              //                                 SizedBox(width: 10,),
                                              //                                 Expanded(
                                              //                                   child: CustomTextFormField(
                                              //                                       textLabel: "أقل كمية",
                                              //                                       textController: payType,
                                              //                                       keyboardType: TextInputType.number
                                              //                                   ),
                                              //                                 ),
                                              //                                 SizedBox(width: 10,),
                                              //                                 Expanded(
                                              //                                   child: CustomTextFormField(
                                              //                                       textLabel: "سعر الصرف",
                                              //                                       textController: payType,
                                              //                                       keyboardType: TextInputType.number
                                              //                                   ),
                                              //                                 ),
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Row(
                                              //                               children: [
                                              //                                 Expanded(
                                              //                                   child: CustomText(
                                              //                                     text: " تاريخ العرض",
                                              //                                     textColor: Colors.grey,
                                              //                                     textFontWeight: FontWeight.bold,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                   flex: 1,
                                              //                                 ),
                                              //                                 Expanded(
                                              //                                   flex: 2,
                                              //                                   child: CustomText(
                                              //                                     text: "15 مايو 2021",
                                              //                                     textColor: nameColor,
                                              //                                     textFontWeight: FontWeight.w500,
                                              //                                     textSize: 14.0,
                                              //                                   ),
                                              //                                 )
                                              //                               ],
                                              //                             ),
                                              //
                                              //                             SizedBox(height: 10,),
                                              //
                                              //                             Container(
                                              //                               width: double.infinity,
                                              //                               child:
                                              //                               Row(
                                              //                                 mainAxisAlignment: MainAxisAlignment.center,
                                              //                                 children: [
                                              //                                   TextButton(
                                              //                                       onPressed: () {
                                              //                                         Get.back();
                                              //                                         showDialog(context: context, builder: (context) {
                                              //                                           return AlertDialog(
                                              //                                             content: Column(
                                              //                                               mainAxisSize: MainAxisSize.min,
                                              //                                               crossAxisAlignment: CrossAxisAlignment.center,
                                              //                                               children: [
                                              //                                                 Row(
                                              //                                                   mainAxisAlignment: MainAxisAlignment.end,
                                              //                                                   children: [
                                              //                                                     GestureDetector(
                                              //                                                       onTap:(){
                                              //                                                         Get.back();
                                              //                                                       },
                                              //                                                       child: Icon(Icons.close,size: 20,color: mainColor,),
                                              //                                                     )
                                              //                                                   ],
                                              //                                                 ),
                                              //                                                 SizedBox(height: 15,),
                                              //                                                 Image.asset("assets/images/rightIcon.PNG",width: 50,),
                                              //                                                 SizedBox(height: 15,),
                                              //                                                 CustomText(
                                              //                                                   text: "تم إضافة العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                                              //                                                   textFontWeight: FontWeight.w500,
                                              //                                                   textColor: mainColor,
                                              //                                                   textSize: 18.0,
                                              //                                                 ),
                                              //                                                 SizedBox(height: 15,),
                                              //                                                 Container(
                                              //                                                   width: double.infinity,
                                              //                                                   child:
                                              //                                                   CustomButton(
                                              //                                                     buttonText: "إضافة عرض جديد",
                                              //                                                     buttonOnPress: () {
                                              //                                                       Get.find<HomeController>().controller.index = 2;
                                              //                                                       Get.back();
                                              //                                                     },
                                              //                                                   ),
                                              //                                                 )
                                              //                                               ],
                                              //                                             ),
                                              //                                           );
                                              //                                         });
                                              //                                       },
                                              //                                       child: CustomText(
                                              //                                         text: "حذف العرض",
                                              //                                         textColor: mainColor,
                                              //                                         textSize: 16.0,
                                              //                                       )),
                                              //                                   TextButton(
                                              //                                       onPressed: (){},
                                              //                                       child: CustomText(
                                              //                                         text: "تعديل العرض",
                                              //                                         textColor: mainColor,
                                              //                                         textSize: 16.0,
                                              //                                       )),
                                              //                                 ],
                                              //                               )
                                              //                             )
                                              //
                                              //                           ],
                                              //                         )
                                              //                     )
                                              //                 );
                                              //
                                              //               },
                                              //             ),
                                              //           )
                                              //         ],
                                              //       ),
                                              //     );
                                              //   });
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
        )
    );
  }
}
