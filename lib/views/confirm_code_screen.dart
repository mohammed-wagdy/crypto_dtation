import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmCodeScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(child: Image.asset("assets/images/forgetPassword.png",height: 200,)),

            CustomText(
              text: "برجاء كتابة كود التفعيل لإستكمال التسجيل",
              textSize: 17,
              textColor: mainColor,
              textFontWeight: FontWeight.w600,
            ),

            SizedBox(height: 20,),

            CustomTextFormField(
                textLabel: "كود التفعيل",
                textController: controller.confirmCodeController,
                keyboardType: TextInputType.number),

            SizedBox(height: 30,),


            Container(
              width: double.infinity,
              child: CustomButton(
                buttonText: "إرسال",
                buttonTextSize: 17.0,
                buttonTextFontWeight: FontWeight.w700,
                buttonOnPress: () {
                  controller.verifyAccount();
                },
              ),
            ),

            SizedBox(height: 20,),

            Container(
              width: double.infinity,
              child: CustomButton(
                buttonText: "تسجيل الدخول",
                buttonTextSize: 17.0,
                buttonBackground: Color(0XFF2f3640),
                buttonTextColor: whiteColor,
                buttonTextFontWeight: FontWeight.w700,
                buttonOnPress: () {
                  Get.toNamed(Routes.LOGIN);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
