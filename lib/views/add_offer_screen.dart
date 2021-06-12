import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/grid_user_block.dart';
import 'package:crypto_station/widgets/grid_user_with_status.dart';
import 'package:crypto_station/widgets/list_user_block.dart';
import 'package:crypto_station/widgets/list_user_with_status.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddOfferScreen extends GetView<OffersController> {

  OffersController controller = Get.put(OffersController());
  AuthController Authcontroller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    // // Set Values
    controller.paymentTypeController.text = "";
    controller.lowQuantitycontroller.text = "";
    controller.quantityController.text = "";
    controller.payPriceController.text = "";
    controller.countrySelect = null;

    print("FODFODOFOFODFDIDI ${controller.user.value.id}");
    return Obx(() => Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SpecialAppBar(
            drawerContext: context,
            appBarTitle: "إضافة عرض",
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


              CustomTextFormField(
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
                ],
              ),

              SizedBox(height: 15,),



              SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                        textLabel: "الكمية",
                        textController: controller.quantityController,
                        keyboardType: TextInputType.number
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextFormField(
                        textLabel: "أقل كمية",
                        textController: controller.lowQuantitycontroller,
                        keyboardType: TextInputType.number
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: CustomTextFormField(
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
                    buttonText: "إضافة",
                    buttonTextFontWeight: FontWeight.w500,
                    buttonOnPress: () async {
                      await controller.addOffer();
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
