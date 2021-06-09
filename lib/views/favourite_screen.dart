import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class FavouriteScreen extends GetView<FavouriteController> {

  @override
  Widget build(BuildContext context) {
    FavouriteController controller = Get.put(FavouriteController());
    HomeController homController = Get.put(HomeController());
    GetStorage box = GetStorage();
    controller.getFavouriteList();
    return Obx(() => Scaffold(
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
              GridView.builder(
                itemCount: controller.favList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 4.2),
                ),
                itemBuilder: (context,index) {
                  DateTime dateTime = DateTime.parse(controller.favList[index]['offer']["created_at"],);
                  String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);
                  return Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
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
                        child:  Column(
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
                                        image: NetworkImage(controller.favList[index]['user']['image']),
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
                                              text: controller.favList[index]['user']['full_name'].toString(),
                                              textColor: nameColor,
                                              textSize: 18.0,
                                              textFontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              print('fdfddf');
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
                                            children: Helper.getStarsList(double.parse(controller.favList[index]['user']['rate'])),),
                                          SizedBox(width: 20,),
                                          Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
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
                                      text: controller.favList[index]['offer']["pay_price"],
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
                                          text: controller.favList[index]['offer']["quantity"],
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
                                                              image: NetworkImage(controller.favList[index]["user"]["image"],),
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
                                                                    text: controller.favList[index]["user"]["full_name"],
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
                                                                  children: Helper.getStarsList(double.parse(controller.favList[index]["user"]["rate"])),),
                                                                SizedBox(width: 20,),
                                                                Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
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
                                                                controller.favList[index]['offer']["status"].toString() == "pending" ? Colors.orange :
                                                                controller.favList[index]['offer']["status"].toString() == "rejected"  ? redColor :
                                                                controller.favList[index]['offer']["status"].toString() == "finished" ? redColor :
                                                                controller.favList[index]['offer']["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                            ),
                                                            SizedBox(width: 3,),
                                                            CustomText(
                                                              text:
                                                              controller.favList[index]['offer']["status"].toString() == "pending" ? "معلق" :
                                                              controller.favList[index]['offer']["status"].toString() == "rejected"  ? "مرفوض" :
                                                              controller.favList[index]['offer']["status"].toString() == "finished" ? "منتهي" :
                                                              controller.favList[index]['offer']["status"].toString() == "accepted" ? "نشط" : "",
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
                                                          text: controller.favList[index]['offer']["id"].toString(),
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
                                                          text: controller.favList[index]['offer']["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
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
                                                          text: controller.favList[index]['offer']["currency_type"].toString(),
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
                                                          text: controller.favList[index]['offer']["payment_type"].toString(),
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
                                                            Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                                                            SizedBox(width: 10,),
                                                            CustomText(
                                                              text: "مصر",
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
                                                          text: "علي المشتري (${controller.favList[index]['offer']["percent"].toString()})",
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
                                                            initVal: controller.favList[index]['offer']["quantity"].toString(),
                                                            // textController: payType,
                                                            keyboardType: TextInputType.number
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Expanded(
                                                        child: CustomTextFormField(
                                                            isInitialValue: true,
                                                            initVal: controller.favList[index]['offer']["low_quantity"].toString(),
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
                                                            initVal: controller.favList[index]['offer']["pay_price"].toString(),
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
                                                    controller.favList[index]["user"]["id"] != box.read("currentUser")['id'] ?
                                                    CustomButton(
                                                      buttonText: "طلب العرض",
                                                      buttonOnPress: () {

                                                        // Order Offer
                                                        homController.orderOffer(user_id: box.read("currentUser")['id'].toString(),offer_id: controller.favList[index]['offer']["id"].toString());


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
                      ),
                      Positioned(
                        left: 15,
                        top: 65,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                          decoration: BoxDecoration(
                              color: grayColor,
                              borderRadius: BorderRadius.all(Radius.circular(3.0))
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10.0,
                                color:
                                controller.favList[index]['offer']["status"].toString() == "pending" ? Colors.orange :
                                controller.favList[index]['offer']["status"].toString() == "rejected"  ? redColor :
                                controller.favList[index]['offer']["status"].toString() == "finished" ? redColor :
                                controller.favList[index]['offer']["status"].toString() == "accepted" ? greenColor : Colors.orange
                                ,
                              ),
                              SizedBox(width: 3,),
                              CustomText(
                                text:
                                controller.favList[index]['offer']["status"].toString() == "pending" ? "معلق" :
                                controller.favList[index]['offer']["status"].toString() == "rejected"  ? "مرفوض" :
                                controller.favList[index]['offer']["status"].toString() == "finished" ? "منتهي" :
                                controller.favList[index]['offer']["status"].toString() == "accepted" ? "نشط" : ""
                                ,
                                textSize: 13.0,
                                textColor: whiteColor,
                              )
                            ],
                          ),
                        ),),
                    ],
                  );
                },
              ) :
              ListView.builder(
                  itemCount: controller.favList.length,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime dateTime = DateTime.parse(controller.favList[index]['offer']["created_at"],);
                    String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      // User Image
                                      Container(
                                        width: 50,
                                        height: 50,
                                        padding: EdgeInsets.all(100),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: grayColor),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(controller.favList[index]['user']['image']),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                text: controller.favList[index]['user']['full_name'].toString(),
                                                textColor: nameColor,
                                                textSize: 16.0,
                                                textFontWeight: FontWeight.bold,
                                              ),
                                              SizedBox(width: 10,),
                                              Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                                              SizedBox(width: 20,),
                                              GestureDetector(
                                                onTap: () {
                                                  print('fdfddf');
                                                },
                                                child: Icon(Icons.favorite,color: favouriteColor,),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: Helper.getStarsList(double.parse(controller.favList[index]['user']['rate'])),),
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 10,),
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
                                        text: controller.favList[index]['offer']["pay_price"],
                                        textColor: nameColor,
                                        textFontWeight: FontWeight.w600,
                                        textSize: 18,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              //SizedBox(height: 10,),
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
                                            text: controller.favList[index]['offer']["quantity"],
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
                                                                image: NetworkImage(controller.favList[index]["user"]["image"],),
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
                                                                      text: controller.favList[index]["user"]["full_name"],
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
                                                                    children: Helper.getStarsList(double.parse(controller.favList[index]["user"]["rate"])),),
                                                                  SizedBox(width: 20,),
                                                                  Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
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
                                                                  controller.favList[index]['offer']["status"].toString() == "pending" ? Colors.orange :
                                                                  controller.favList[index]['offer']["status"].toString() == "rejected"  ? redColor :
                                                                  controller.favList[index]['offer']["status"].toString() == "finished" ? redColor :
                                                                  controller.favList[index]['offer']["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                              ),
                                                              SizedBox(width: 3,),
                                                              CustomText(
                                                                text:
                                                                controller.favList[index]['offer']["status"].toString() == "pending" ? "معلق" :
                                                                controller.favList[index]['offer']["status"].toString() == "rejected"  ? "مرفوض" :
                                                                controller.favList[index]['offer']["status"].toString() == "finished" ? "منتهي" :
                                                                controller.favList[index]['offer']["status"].toString() == "accepted" ? "نشط" : "",
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
                                                            text: controller.favList[index]['offer']["id"].toString(),
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
                                                            text: controller.favList[index]['offer']["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
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
                                                            text: controller.favList[index]['offer']["currency_type"].toString(),
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
                                                            text: controller.favList[index]['offer']["payment_type"].toString(),
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
                                                              Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                                                              SizedBox(width: 10,),
                                                              CustomText(
                                                                text: "مصر",
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
                                                            text: "علي المشتري (${controller.favList[index]['offer']["percent"].toString()})",
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
                                                              initVal: controller.favList[index]['offer']["quantity"].toString(),
                                                              // textController: payType,
                                                              keyboardType: TextInputType.number
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Expanded(
                                                          child: CustomTextFormField(
                                                              isInitialValue: true,
                                                              initVal: controller.favList[index]['offer']["low_quantity"].toString(),
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
                                                              initVal: controller.favList[index]['offer']["pay_price"].toString(),
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
                                                      controller.favList[index]["user"]["id"] != box.read("currentUser")['id'] ?
                                                      CustomButton(
                                                        buttonText: "طلب العرض",
                                                        buttonOnPress: () {

                                                          // Order Offer
                                                          homController.orderOffer(user_id: box.read("currentUser")['id'].toString(),offer_id: controller.favList[index]['offer']["id"].toString());


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
                        ),
                        Positioned(
                          left: 15,
                          top: 55,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                            decoration: BoxDecoration(
                                color: grayColor,
                                borderRadius: BorderRadius.all(Radius.circular(3.0))
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                  color:
                                  controller.favList[index]['offer']["status"].toString() == "pending" ? Colors.orange :
                                  controller.favList[index]['offer']["status"].toString() == "rejected"  ? redColor :
                                  controller.favList[index]['offer']["status"].toString() == "finished" ? redColor :
                                  controller.favList[index]['offer']["status"].toString() == "accepted" ? greenColor : Colors.orange
                                  ,
                                ),
                                SizedBox(width: 3,),
                                CustomText(
                                  text:
                                  controller.favList[index]['offer']["status"].toString() == "pending" ? "معلق" :
                                  controller.favList[index]['offer']["status"].toString() == "rejected"  ? "مرفوض" :
                                  controller.favList[index]['offer']["status"].toString() == "finished" ? "منتهي" :
                                  controller.favList[index]['offer']["status"].toString() == "accepted" ? "نشط" : ""
                                  ,
                                  textSize: 13.0,
                                  textColor: whiteColor,
                                )
                              ],
                            ),
                          ),),
                      ],
                    );
                  })
          ),

          SizedBox(height: 15,),
        ],
      ),
    ));
  }
}
