import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_2.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:crypto_station/widgets/grid_user_with_status.dart';
import 'package:crypto_station/widgets/list_user_block.dart';
import 'package:crypto_station/widgets/list_user_with_status.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdateOfferScreen extends GetView<OffersController> {

  OffersController controller = Get.put(OffersController());
  AuthController Authcontroller = Get.put(AuthController());
  var offerData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print("BBNNBBNN ${offerData}");
    // // Set Values
    controller.paymentTypeController.text = offerData['payment_type'];
    controller.lowQuantitycontroller.text = offerData['low_quantity'];
    controller.quantityController.text = offerData['quantity'];
    controller.payPriceController.text = offerData['pay_price'];
    controller.sell_type.value = offerData['type'] == "pay" ? false : true;
    controller.buy_type.value = offerData['type'] == "pay" ? true : false;
    // // controller.countrySelect = offerData['country_id'];
    return Obx(() => Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "تعديل العرض",
            drawerContext: context,
          )),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                          controller.buy_type.value = true;
                          controller.sell_type.value = false;
                        },
                        value: controller.buy_type.value,
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
                          controller.buy_type.value = false;
                          controller.sell_type.value = true;
                        },
                        value:  controller.sell_type.value,
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


              CustomTextFormField2(
                // isNormal : true,
                // isInitialValue: true,
                //   initVal: offerData["payment_type"],
                  textLabel: "طريقة الدفع",
                textController: controller.paymentTypeController,
                  keyboardType: TextInputType.text
              ),

              SizedBox(height: 15,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "البلد",
                    textColor: textLabelColor,
                    textFontWeight: FontWeight.w500,
                    textSize: 16.0,
                  ),
                  SizedBox(width: 40,),

                  DropdownButton(
                    isExpanded: true,
                    dropdownColor: Colors.white,
                    hint:  Text("أختر الدولة"),
                    items: Authcontroller.allCountries.value.map((country){
                      return  DropdownMenuItem (
                        value: country['id'],
                        child: Row(
                          children: <Widget>[
                            Image.network(country['image'],width: 25,),
                            // Image.network(country['name'],width: 25,),
                            SizedBox(width: 10,),
                            Text(country['name'], style:  TextStyle(color: Colors.black),),
                          ],),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      controller.countrySelect = newVal;
                    },
                    value: controller.countrySelect,
                  ),

                  // Row(
                  //   children: [
                  //     Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                  //     SizedBox(width: 10,),
                  //     CustomText(
                  //       text: "مصر",
                  //     ),
                  //   ],
                  // ),
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
                    textColor: nameColor,
                    text: "علي المشتري (${offerData['percent']})",
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField2(
                      // isNormal: true,
                      // initVal: offerData['quantity'],
                      //   isInitialValue: true,
                        textLabel: "الكمية",
                        textController: controller.quantityController,
                        keyboardType: TextInputType.number
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextFormField2(
                        // isNormal: true,
                        // initVal: offerData['low_quantity'],
                        // isInitialValue: true,
                        textLabel: "أقل كمية",
                        textController: controller.lowQuantitycontroller,
                        keyboardType: TextInputType.number
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextFormField2(
                        // isNormal: true,
                        // initVal: offerData['pay_price'],
                        // isInitialValue: true,
                        textLabel: "سعر الصرف",
                        textController: controller.payPriceController,
                        keyboardType: TextInputType.number
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),


              // Row(
              //   children: [
              //     CustomText(
              //       text: "تاريخ العرض",
              //       textColor: textLabelColor,
              //       textFontWeight: FontWeight.w500,
              //       textSize: 16.0,
              //     ),
              //     SizedBox(width: 40,),
              //     CustomText(
              //       text: "15 مايو 2021 ",
              //     ),
              //   ],
              // ),

              SizedBox(height: 40,),

              controller.isLoading.value ? Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 30,),) : Container(
                width: double.infinity,
                child: CustomButton(
                    buttonText: "حفظ التعديل",
                    buttonTextFontWeight: FontWeight.w500,
                    buttonOnPress: ()  async {
                      print("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV");
                      await controller.updateOffer(offer_id: offerData['id'].toString());
                      // Get.find<HomeController>().controller.index = 0;
                      // showDialog(context: context, builder: (context) {
                      //   return AlertDialog(
                      //     content: Column(
                      //       mainAxisSize: MainAxisSize.min,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.end,
                      //           children: [
                      //             GestureDetector(
                      //               onTap:(){
                      //                 Get.back();
                      //               },
                      //               child: Icon(Icons.close,size: 20,color: mainColor,),
                      //             )
                      //           ],
                      //         ),
                      //         SizedBox(height: 15,),
                      //         Image.asset("assets/images/rightIcon.PNG",width: 50,),
                      //         SizedBox(height: 15,),
                      //         CustomText(
                      //           text: "تم إضافة العرض بنجاح وهو الأن قيد المراجعة تابع البريد الألكتروني أو الأشعارات للمتابعة",
                      //           textFontWeight: FontWeight.w500,
                      //           textColor: mainColor,
                      //           textSize: 18.0,
                      //         ),
                      //         SizedBox(height: 15,),
                      //         Container(
                      //           width: double.infinity,
                      //           child:
                      //           CustomButton(
                      //             buttonText: "إضافة عرض جديد",
                      //             buttonOnPress: () {
                      //               Get.find<HomeController>().controller.index = 2;
                      //               Get.back();
                      //             },
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   );
                      // });
                    }
                ),
              )

            ],
          ),
        ),
      ),
    ));
  }
}
