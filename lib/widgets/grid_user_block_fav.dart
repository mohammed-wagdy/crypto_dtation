import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class GridUserBlockWithStatusFav extends StatelessWidget {
  GetStorage _box = GetStorage();
  final List? listOffersFiltered;

  GridUserBlockWithStatusFav({
    this.listOffersFiltered,
  });

  @override
  Widget build(BuildContext context) {

    final isTablet = Tools.isTablet(MediaQuery.of(context));
    final smallScreen = MediaQuery.of(context).size.width < 410;
    HomeController homController = Get.put(HomeController());

    return
      listOffersFiltered!.isEmpty ? Center(child: Text("لا يوجد عروض",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),) :
      GridView.builder(
        itemCount: listOffersFiltered?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio:
          smallScreen ?
          MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3.2)
              :
          MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4.2),
        ),
        itemBuilder: (context,index) {
          DateTime dateTime = DateTime.parse(listOffersFiltered![index]['offer']["created_at"],);
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
                                image: NetworkImage(listOffersFiltered![index]['user']['image']),
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
                                      text: listOffersFiltered![index]['user']['full_name'].toString(),
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
                                    children: Helper.getStarsList(double.parse(listOffersFiltered![index]['user']['rate'])),),
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
                              text: listOffersFiltered![index]['offer']["pay_price"],
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
                                  text: listOffersFiltered![index]['offer']["quantity"],
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
                                                      image: NetworkImage(listOffersFiltered![index]["user"]["image"],),
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
                                                            text: listOffersFiltered![index]["user"]["full_name"],
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
                                                          children: Helper.getStarsList(double.parse(listOffersFiltered![index]["user"]["rate"])),),
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
                                                        listOffersFiltered![index]['offer']["status"].toString() == "pending" ? Colors.orange :
                                                        listOffersFiltered![index]['offer']["status"].toString() == "rejected"  ? redColor :
                                                        listOffersFiltered![index]['offer']["status"].toString() == "finished" ? redColor :
                                                        listOffersFiltered![index]['offer']["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                    ),
                                                    SizedBox(width: 3,),
                                                    CustomText(
                                                      text:
                                                      listOffersFiltered![index]['offer']["status"].toString() == "pending" ? "معلق" :
                                                      listOffersFiltered![index]['offer']["status"].toString() == "rejected"  ? "مرفوض" :
                                                      listOffersFiltered![index]['offer']["status"].toString() == "finished" ? "منتهي" :
                                                      listOffersFiltered![index]['offer']["status"].toString() == "accepted" ? "نشط" : "",
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
                                                  text: listOffersFiltered![index]['offer']["id"].toString(),
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
                                                  text: listOffersFiltered![index]['offer']["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
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
                                                  text: listOffersFiltered![index]['offer']["currency_type"].toString(),
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
                                                  text: listOffersFiltered![index]['offer']["payment_type"].toString(),
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
                                                  text: "علي المشتري (${listOffersFiltered![index]['offer']["percent"].toString()})",
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
                                                    initVal: listOffersFiltered![index]['offer']["quantity"].toString(),
                                                    // textController: payType,
                                                    keyboardType: TextInputType.number
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Expanded(
                                                child: CustomTextFormField(
                                                    isInitialValue: true,
                                                    initVal: listOffersFiltered![index]['offer']["low_quantity"].toString(),
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
                                                    initVal: listOffersFiltered![index]['offer']["pay_price"].toString(),
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
                                            listOffersFiltered![index]["user"]["id"] != _box.read("currentUser")['id'] ?
                                            CustomButton(
                                              buttonText: "طلب العرض",
                                              buttonOnPress: () {

                                                // Order Offer
                                                homController.orderOffer(user_id: _box.read("currentUser")['id'].toString(),offer_id: listOffersFiltered![index]['offer']["id"].toString());


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
                        listOffersFiltered![index]['offer']["status"].toString() == "pending" ? Colors.orange :
                        listOffersFiltered![index]['offer']["status"].toString() == "rejected"  ? redColor :
                        listOffersFiltered![index]['offer']["status"].toString() == "finished" ? redColor :
                        listOffersFiltered![index]['offer']["status"].toString() == "accepted" ? greenColor : Colors.orange
                        ,
                      ),
                      SizedBox(width: 3,),
                      CustomText(
                        text:
                        listOffersFiltered![index]['offer']["status"].toString() == "pending" ? "معلق" :
                        listOffersFiltered![index]['offer']["status"].toString() == "rejected"  ? "مرفوض" :
                        listOffersFiltered![index]['offer']["status"].toString() == "finished" ? "منتهي" :
                        listOffersFiltered![index]['offer']["status"].toString() == "accepted" ? "نشط" : ""
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
      );
  }
}
