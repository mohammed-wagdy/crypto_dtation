import 'package:crypto_station/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomTextFormField(
                textLabel: "أسم المستخدم",
                textController: controller.paymentTypeController,
                keyboardType: TextInputType.text
            ),

            SizedBox(height: 15,),

            CustomTextFormField(
                textLabel: "رقم العرض",
                textController: controller.paymentTypeController,
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
                        //controller.changeRememberMe(val);
                      },
                      value: true,
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
                        //controller.changeRememberMe(val);
                      },
                      value: true,
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

            Row(
              children: [
                CustomText(
                  text: "البلد",
                  textColor: textLabelColor,
                  textFontWeight: FontWeight.w500,
                  textSize: 16.0,
                ),
                SizedBox(width: 40,),
                // Row(
                //   children: [
                //     Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                //     SizedBox(width: 10,),
                //     CustomText(
                //       text: "مصر",
                //     ),
                //   ],
                // ),
                CountryListPick(
                  useSafeArea: true,
                  appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(60),
                      child: AppBar(
                        backgroundColor: mainColor,
                        elevation: 0.0,
                        automaticallyImplyLeading: false,
                        title: Text("أختر الدولة",style: TextStyle(height: 1.6),),
                        centerTitle: true,
                      )),
                  theme: CountryTheme(
                    isShowFlag: true,
                    isShowTitle: false,
                    isShowCode: false,
                    isDownIcon: true,
                    showEnglishName: false,
                  ),
                  initialSelection: "EG",
                  onChanged: (country) {
                    print("country is ${country?.code}");
                  },
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
                  },
                  value: true,
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
                        //controller.changeRememberMe(val);
                      },
                      value: true,
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
                        //controller.changeRememberMe(val);
                      },
                      value: true,
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


            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: BorderSide(color: textLabelColor),
                      activeColor: mainColor,
                      onChanged: (val) {
                        //controller.changeRememberMe(val);
                      },
                      value: true,
                    ),
                    CustomText(
                      text: "ترتيب من الأقدم للأحدث",
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
                        //controller.changeRememberMe(val);
                      },
                      value: true,
                    ),
                    CustomText(
                      text: "ترتيب من الأحدث للأقدم",
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
                  Get.toNamed(Routes.SEARCH_RESULT);
                  }),
            )

          ],
        ),
      ),
    );
  }
}
