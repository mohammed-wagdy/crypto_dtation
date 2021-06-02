import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:intl/intl.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllUserRequests extends GetView<ProfileController> {
  final format = DateFormat.jm();

  @override
  Widget build(BuildContext context) {

    controller.getOrdersRequestsCount();

    return Obx(() => Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomDarkAppBar(
              appBarTitle: "الطلبات",
              drawerContext: context,
            )),
        body: controller.allRequests.value.isEmpty ? Center(child: Text("لا يوجد طلبات",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),) : Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(

              separatorBuilder: (BuildContext ctn, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 20.0,
                  ),
                );
              },
              itemCount: controller.allRequests.value.length,
              itemBuilder: ((BuildContext context, int index) {
                DateTime dateTime = DateTime.parse(controller.allRequests.value[index]['created_at']);
                String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);

                return Container(
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
                                      fit: BoxFit.cover,
                                      image:
                                      controller.allRequests.value[index]['user']['image']== null || controller.allRequests.value[index]['user']['image'] == "user.png" ?
                                      NetworkImage("https://www.pngjoy.com/pngm/136/2750635_gray-circle-login-user-icon-png-transparent-png.png") :
                                      NetworkImage("${controller.allRequests.value[index]['user']['image'].toString()}"),
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
                                            text: controller.allRequests.value[index]['user']['full_name'].toString(),
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
                                          children: Helper.getStarsList(double.parse(controller.allRequests.value[index]['user']['rate'])),),
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
                                      Icons.circle,
                                      size: 10.0,
                                      color:
                                      controller.allRequests.value[index]['status'].toString() == "pending" ? Colors.orange :
                                      controller.allRequests.value[index]['status'].toString() == "rejected"  ? redColor :
                                      controller.allRequests.value[index]['status'].toString() == "finished" ? redColor :
                                      controller.allRequests.value[index]['status'].toString() == "accepted" ? greenColor : Colors.orange
                                    ),
                                    SizedBox(width: 3,),
                                    CustomText(
                                      text:
                                      controller.allRequests.value[index]['status'].toString() == "pending" ? "معلق" :
                                      controller.allRequests.value[index]['status'].toString()== "rejected"  ? "مرفوض" :
                                      controller.allRequests.value[index]['status'].toString() == "finished" ? "منتهي" :
                                      controller.allRequests.value[index]['status'].toString() == "accepted" ? "نشط" : "",

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
                                  text: controller.allRequests.value[index]['id'].toString(),
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
                                  text: controller.allRequests.value[index]['type'].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
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
                                  text: controller.allRequests.value[index]['currency_type'].toString() ,
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
                                  text: controller.allRequests.value[index]['payment_type'].toString() ,
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
                                  text: "علي المشتري (${controller.allRequests.value[index]['percent'].toString()})",
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
                                    isInitialValue: true,
                                  isReadOnly: true,
                                    textLabel: "الكمية",
                                    initVal: controller.allRequests.value[index]['quantity'].toString(),
                                   // textController: controller.quantityController,
                                    keyboardType: TextInputType.number
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: CustomTextFormField(
                                    isInitialValue: true,
                                    isReadOnly: true,
                                    initVal: controller.allRequests.value[index]['low_quantity'].toString(),
                                    textLabel: "أقل كمية",
                                  //  textController: controller.lessQuantityController,
                                    keyboardType: TextInputType.number
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: CustomTextFormField(
                                    isInitialValue: true,
                                    isReadOnly: true,
                                    initVal: controller.allRequests.value[index]['pay_price'].toString(),
                                    textLabel: "سعر الصرف",
                                   // textController: controller.payPriceController,
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
                          //
                          // SizedBox(height: 10,),
                          //
                          // Container(
                          //   width: double.infinity,
                          //   child:
                          //   CustomButton(
                          //     buttonText: "طلب العرض",
                          //     buttonOnPress: () {
                          //       Get.back();
                          //       showDialog(context: context, builder: (context) {
                          //         return AlertDialog(
                          //           content: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             crossAxisAlignment: CrossAxisAlignment.center,
                          //             children: [
                          //               Row(
                          //                 mainAxisAlignment: MainAxisAlignment.end,
                          //                 children: [
                          //                   GestureDetector(
                          //                     onTap:(){
                          //                       Get.back();
                          //                     },
                          //                     child: Icon(Icons.close,size: 20,color: mainColor,),
                          //                   )
                          //                 ],
                          //               ),
                          //               SizedBox(height: 15,),
                          //               Image.asset("assets/images/rightIcon.PNG",width: 50,),
                          //               SizedBox(height: 15,),
                          //               CustomText(
                          //                 text: "تم طلب العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                          //                 textFontWeight: FontWeight.w500,
                          //                 textColor: mainColor,
                          //                 textSize: 18.0,
                          //               ),
                          //               SizedBox(height: 15,),
                          //               Container(
                          //                 width: double.infinity,
                          //                 child:
                          //                 CustomButton(
                          //                   buttonText: "مشاهدة العرض",
                          //                   buttonOnPress: () {
                          //                     Get.back();
                          //                     Get.bottomSheet(
                          //                         Container(
                          //                             color: whiteColor,
                          //                             padding: EdgeInsets.all(10.0),
                          //                             child: Column(
                          //                               children: [
                          //                                 Row(
                          //                                   children: [
                          //                                     // User Image
                          //                                     Container(
                          //                                       width: 60,
                          //                                       height: 60,
                          //                                       decoration: BoxDecoration(
                          //                                           border: Border.all(color: grayColor),
                          //                                           shape: BoxShape.circle,
                          //                                           image: DecorationImage(
                          //                                             image: NetworkImage("https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
                          //                                           )
                          //                                       ),
                          //                                     ),
                          //
                          //                                     SizedBox(width: 10,),
                          //
                          //                                     Expanded(
                          //                                       child: Column(
                          //                                         crossAxisAlignment: CrossAxisAlignment.start,
                          //                                         children: [
                          //
                          //                                           // Name and Favourite
                          //                                           Row(
                          //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                                             // crossAxisAlignment: CrossAxisAlignment.stretch,
                          //                                             children: [
                          //                                               Expanded(
                          //                                                 child: CustomText(
                          //                                                   userName: true,
                          //                                                   text: " محمد وجدي محمد ",
                          //                                                   textColor: nameColor,
                          //                                                   textSize: 18.0,
                          //                                                   textFontWeight: FontWeight.bold,
                          //                                                 ),
                          //                                               ),
                          //                                             ],
                          //                                           ),
                          //
                          //                                           SizedBox(height: 5,),
                          //
                          //                                           // Rating and flag
                          //                                           Row(
                          //                                             children: [
                          //                                               Row(
                          //                                                 children: Helper.getStarsList(2.5),),
                          //                                               SizedBox(width: 20,),
                          //                                               Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                          //                                             ],
                          //                                           )
                          //
                          //                                         ],
                          //                                       ),
                          //                                     ),
                          //
                          //                                     Container(
                          //                                       padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                          //                                       decoration: BoxDecoration(
                          //                                           color: grayColor,
                          //                                           borderRadius: BorderRadius.all(Radius.circular(3.0))
                          //                                       ),
                          //                                       child: Row(
                          //                                         mainAxisSize: MainAxisSize.min,
                          //                                         children: [
                          //                                           Icon(Icons.circle,size: 10.0, color: redColor,),
                          //                                           SizedBox(width: 3,),
                          //                                           CustomText(
                          //                                             text: "منتهي",
                          //                                             textSize: 13.0,
                          //                                             textColor: whiteColor,
                          //                                           )
                          //                                         ],
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       flex:1,
                          //                                       child: CustomText(
                          //                                         text: "رقم العرض",
                          //                                         textColor: Colors.grey,
                          //                                         textFontWeight: FontWeight.bold,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     ),
                          //                                     Expanded(
                          //                                       flex: 2,
                          //                                       child: CustomText(
                          //                                         text: "521458",
                          //                                         textColor: nameColor,
                          //                                         textFontWeight: FontWeight.w500,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       flex:1,
                          //                                       child: CustomText(
                          //                                         text: "حالة العرض",
                          //                                         textColor: Colors.grey,
                          //                                         textFontWeight: FontWeight.bold,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     ),
                          //                                     Expanded(
                          //                                       flex: 2,
                          //                                       child: CustomText(
                          //                                         text: "مطلوب للبيع",
                          //                                         textColor: nameColor,
                          //                                         textFontWeight: FontWeight.w500,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       flex:1,
                          //                                       child: CustomText(
                          //                                         text: "نوع العملة",
                          //                                         textColor: Colors.grey,
                          //                                         textFontWeight: FontWeight.bold,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     ),
                          //                                     Expanded(
                          //                                       flex: 2,
                          //                                       child: CustomText(
                          //                                         text: "USDT",
                          //                                         textColor: nameColor,
                          //                                         textFontWeight: FontWeight.w500,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       flex: 1,
                          //                                       child: CustomText(
                          //                                         text: "طريقة الدفع",
                          //                                         textColor: Colors.grey,
                          //                                         textFontWeight: FontWeight.bold,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     ),
                          //                                     Expanded(
                          //                                       flex: 2,
                          //                                       child: CustomText(
                          //                                         text: "البنك العربي الأفريقي",
                          //                                         textColor: nameColor,
                          //                                         textFontWeight: FontWeight.w500,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       flex:1,
                          //                                       child: CustomText(
                          //                                         text: "البلد",
                          //                                         textColor: Colors.grey,
                          //                                         textFontWeight: FontWeight.bold,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     ),
                          //                                     Expanded(
                          //                                       flex:2,
                          //                                       child: Row(
                          //                                         children: [
                          //                                           Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                          //                                           SizedBox(width: 10,),
                          //                                           CustomText(
                          //                                             text: "مصر",
                          //                                             textColor: nameColor,
                          //                                             textFontWeight: FontWeight.w500,
                          //                                             textSize: 14.0,
                          //                                           ),
                          //                                         ],
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       flex:1,
                          //                                       child: CustomText(
                          //                                         text: "عمولة الوساطة",
                          //                                         textColor: Colors.grey,
                          //                                         textFontWeight: FontWeight.bold,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     ),
                          //                                     Expanded(
                          //                                       flex: 2,
                          //                                       child: CustomText(
                          //                                         text: "علي المشتري (5%)",
                          //                                         textColor: nameColor,
                          //                                         textFontWeight: FontWeight.w500,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       child: CustomTextFormField(
                          //                                           textLabel: "الكمية",
                          //                                           textController: controller.passwordController,
                          //                                           keyboardType: TextInputType.number
                          //                                       ),
                          //                                     ),
                          //                                     SizedBox(width: 10,),
                          //                                     Expanded(
                          //                                       child: CustomTextFormField(
                          //                                           textLabel: "أقل كمية",
                          //                                           textController: controller.passwordController,
                          //                                           keyboardType: TextInputType.number
                          //                                       ),
                          //                                     ),
                          //                                     SizedBox(width: 10,),
                          //                                     Expanded(
                          //                                       child: CustomTextFormField(
                          //                                           textLabel: "سعر الصرف",
                          //                                           textController: controller.passwordController,
                          //                                           keyboardType: TextInputType.number
                          //                                       ),
                          //                                     ),
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Row(
                          //                                   children: [
                          //                                     Expanded(
                          //                                       child: CustomText(
                          //                                         text: " تاريخ العرض",
                          //                                         textColor: Colors.grey,
                          //                                         textFontWeight: FontWeight.bold,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                       flex: 1,
                          //                                     ),
                          //                                     Expanded(
                          //                                       flex: 2,
                          //                                       child: CustomText(
                          //                                         text: "15 مايو 2021",
                          //                                         textColor: nameColor,
                          //                                         textFontWeight: FontWeight.w500,
                          //                                         textSize: 14.0,
                          //                                       ),
                          //                                     )
                          //                                   ],
                          //                                 ),
                          //
                          //                                 SizedBox(height: 10,),
                          //
                          //                                 Container(
                          //                                     width: double.infinity,
                          //                                     child:
                          //                                     Row(
                          //                                       mainAxisAlignment: MainAxisAlignment.center,
                          //                                       children: [
                          //                                         TextButton(
                          //                                             onPressed: () {
                          //                                               Get.back();
                          //                                               showDialog(context: context, builder: (context) {
                          //                                                 return AlertDialog(
                          //                                                   content: Column(
                          //                                                     mainAxisSize: MainAxisSize.min,
                          //                                                     crossAxisAlignment: CrossAxisAlignment.center,
                          //                                                     children: [
                          //                                                       Row(
                          //                                                         mainAxisAlignment: MainAxisAlignment.end,
                          //                                                         children: [
                          //                                                           GestureDetector(
                          //                                                             onTap:(){
                          //                                                               Get.back();
                          //                                                             },
                          //                                                             child: Icon(Icons.close,size: 20,color: mainColor,),
                          //                                                           )
                          //                                                         ],
                          //                                                       ),
                          //                                                       SizedBox(height: 15,),
                          //                                                       Image.asset("assets/images/rightIcon.PNG",width: 50,),
                          //                                                       SizedBox(height: 15,),
                          //                                                       CustomText(
                          //                                                         text: "تم إضافة العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                          //                                                         textFontWeight: FontWeight.w500,
                          //                                                         textColor: mainColor,
                          //                                                         textSize: 18.0,
                          //                                                       ),
                          //                                                       SizedBox(height: 15,),
                          //                                                       Container(
                          //                                                         width: double.infinity,
                          //                                                         child:
                          //                                                         CustomButton(
                          //                                                           buttonText: "إضافة عرض جديد",
                          //                                                           buttonOnPress: () {
                          //                                                             Get.find<HomeController>().controller.index = 2;
                          //                                                             Get.back();
                          //                                                           },
                          //                                                         ),
                          //                                                       )
                          //                                                     ],
                          //                                                   ),
                          //                                                 );
                          //                                               });
                          //                                             },
                          //                                             child: CustomText(
                          //                                               text: "حذف العرض",
                          //                                               textColor: mainColor,
                          //                                               textSize: 16.0,
                          //                                             )),
                          //                                         TextButton(
                          //                                             onPressed: (){},
                          //                                             child: CustomText(
                          //                                               text: "تعديل العرض",
                          //                                               textColor: mainColor,
                          //                                               textSize: 16.0,
                          //                                             )),
                          //                                       ],
                          //                                     )
                          //                                 )
                          //
                          //                               ],
                          //                             )
                          //                         )
                          //                     );
                          //                     // Get.back();
                          //                     // showDialog(context: context, builder: (context) {
                          //                     //   return AlertDialog(
                          //                     //     content: Column(
                          //                     //       mainAxisSize: MainAxisSize.min,
                          //                     //       crossAxisAlignment: CrossAxisAlignment.center,
                          //                     //       children: [
                          //                     //         Row(
                          //                     //           mainAxisAlignment: MainAxisAlignment.end,
                          //                     //           children: [
                          //                     //             GestureDetector(
                          //                     //               onTap:(){
                          //                     //                 Get.back();
                          //                     //               },
                          //                     //               child: Icon(Icons.close,size: 20,color: mainColor,),
                          //                     //             )
                          //                     //           ],
                          //                     //         ),
                          //                     //         SizedBox(height: 15,),
                          //                     //         Image.asset("assets/images/rightIcon.PNG",width: 50,),
                          //                     //         SizedBox(height: 15,),
                          //                     //         CustomText(
                          //                     //           text: "تم طلب العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                          //                     //           textFontWeight: FontWeight.w500,
                          //                     //           textColor: mainColor,
                          //                     //           textSize: 18.0,
                          //                     //         ),
                          //                     //         SizedBox(height: 15,),
                          //                     //         Container(
                          //                     //           width: double.infinity,
                          //                     //           child:
                          //                     //           CustomButton(
                          //                     //             buttonText: "مشاهدة العرض",
                          //                     //             buttonOnPress: () {
                          //                     //               Get.find<HomeController>().controller.index = 2;
                          //                     //               Get.back();
                          //                     //             },
                          //                     //           ),
                          //                     //         )
                          //                     //       ],
                          //                     //     ),
                          //                     //   );
                          //                     // });
                          //                   },
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         );
                          //       });
                          //     },
                          //   ),
                          // )

                        ],
                      ),
                    )
                );
              })),
        )));
  }
}
