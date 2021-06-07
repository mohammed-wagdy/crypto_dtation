import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:country_list_pick/country_list_pick.dart';

class AdvancedSearchScreen extends GetView<OffersController> {

  OffersController controller = Get.put(OffersController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: mainColor,
            elevation: 0.0,
            //  automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("بحث متقدم"),
          )),

      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomTextFormField(
                  textLabel: "أسم المستخدم",
                  textController: controller.userNameController,
                  keyboardType: TextInputType.text
              ),


              SizedBox(height: 15,),


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
                          controller.search_buy_type.value = true;
                          controller.search_sell_type.value = false;
                        },
                        value: controller.search_buy_type.value,
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
                          controller.search_buy_type.value = false;
                          controller.search_sell_type.value = true;
                        },
                        value:  controller.search_sell_type.value,
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
                    items: authController.allCountries.value.map((country){
                      return  DropdownMenuItem (
                        value: country['id'],
                        child: Row(
                          children: <Widget>[
                            Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/255px-Flag_of_Egypt.svg.png",width: 25,),
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

              Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(color: textLabelColor),
                    activeColor: mainColor,
                    onChanged: (val) {
                      //controller.changeRememberMe(val);
                      controller.today_day.value = val!;
                    },
                    value: controller.today_day.value,
                  ),
                  CustomText(
                    text: "عروض اليوم",
                    textColor: textLabelColor,
                    textSize: 14.0,
                    textFontWeight: FontWeight.w500,
                  )
                ],
              ),


              SizedBox(height: 15,),

              Row(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: BorderSide(color: textLabelColor),
                        activeColor: mainColor,
                        onChanged: (val) {
                          controller.search_small_to_big.value = true;
                          controller.search_big_to_small.value = false;
                        },
                        value: controller.search_small_to_big.value,
                      ),
                      CustomText(
                        text: "ترتيب تصاعدي",
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
                          controller.search_small_to_big.value = false;
                          controller.search_big_to_small.value = true;
                        },
                        value:  controller.search_big_to_small.value,
                      ),
                      CustomText(
                        text: "ترتيب تنازلي",
                        textColor: textLabelColor,
                        textSize: 14.0,
                        textFontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ],
              ),




              SizedBox(height: 40,),

              Container(
                width: double.infinity,
                child: CustomButton(
                    buttonText: "بحث الأن",
                    buttonTextFontWeight: FontWeight.w500,
                    buttonOnPress: (){
                      // Get.toNamed(Routes.SEARCH_RESULT);
                      controller.advancedSearch();
                    }),
              )

            ],
          ),
        ),
      ),
    ));
  }
}
