import 'dart:ui';

import 'package:crypto_station/constants.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/providers/auth_providers.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  RxInt count = 0.obs;
  RxBool rememberMe = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("IAM AUTH CONTROLLER");
  }

  changeRememberMe(value) {
    rememberMe.value = value;
  }

  // Login
  Future login() async {
    if(emailController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل البريد الألكتروني");
    } else if(!GetUtils.isEmail(emailController.text)) {
      Helper.errorSnackBar("خطأ", "من فضلك تأكد من صحة البريد الألكتروني");
    }
    else if(passwordController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل كلمة المرور");
    } else if(passwordController.text.length < 8) {
      Helper.errorSnackBar("خطأ", "كلمة المرور يجب أن تكون أكثر من 8 حروف أو أرقام");
    } else {

      // Do Login Here
      AuthProvider().login().then((value) {
        // Deal With API From Here .....
      });
      print("EMAIL IS ${emailController.text} AND PASSWORD IS ${passwordController.text}");
      Helper.successSnackBar("جيد", "تم تسجيل الدخول بنجاح");
    }
  }





  // Register
  Future register() async {
    if(fullNameController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل أسمك بالكامل");
    } else if(emailController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل البريد الألكتروني");
    } else if(!GetUtils.isEmail(emailController.text)) {
      Helper.errorSnackBar("خطأ", "من فضلك تأكد من صحة البريد الألكتروني");
    }
    else if(passwordController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل كلمة المرور");
    } else if(passwordController.text.length < 8) {
      Helper.errorSnackBar("خطأ", "كلمة المرور يجب أن تكون أكثر من 8 حروف أو أرقام");
    } else {

      // Do Login Here
      print("EMAIL IS ${emailController.text} AND PASSWORD IS ${passwordController.text}");
      Helper.successSnackBar("جيد", "تم التسجيل بنجاح");

    }
  }



  // Reset Password
  Future resetPassword() async {
  if(emailController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل البريد الألكتروني");
    } else if(!GetUtils.isEmail(emailController.text)) {
      Helper.errorSnackBar("خطأ", "من فضلك تأكد من صحة البريد الألكتروني");
    } else {

      // Do Login Here
      print("EMAIL IS ${emailController.text} AND PASSWORD IS ${passwordController.text}");
      Get.back();
      Get.defaultDialog(
        titleStyle: TextStyle(height: 0.0),
        radius: 5.0,
        title: "",
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.close,color: mainColor,),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 20.0,),
              Icon(Icons.verified,size: 60,color: mainColor,),
              SizedBox(height: 20,),
              CustomText(
                textFontWeight: FontWeight.bold,
                textColor: mainColor,
                textTextAlign: TextAlign.center,
                text: "تم إرسال كلمة المرور إلي البريد الألكتروني . برجاء التحقيق وتسجيل الدخول مرة أخري",
              )
            ],
          ),
        ),
      );
    }
  }


}