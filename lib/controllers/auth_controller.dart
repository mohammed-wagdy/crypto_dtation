import 'dart:convert';
import 'dart:ui';
import 'package:crypto_station/constants.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/models/user.dart';
import 'package:crypto_station/providers/auth_providers.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {

  RxInt count = 0.obs;
  RxBool rememberMe = false.obs;
  RxBool isLoading = false.obs;
  User user = new User();
  GetStorage box = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController walletAddressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController confirmCodeController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCountries();
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
      isLoading.value = true;
    await  AuthProvider().login(
        email: emailController.text,
        password: passwordController.text
      ).then((value) {
        if(value['status'] == 1) {

          // Save User To His Model
          user = User.fromJSON(value['user']);
          if(user.status == "not_active") {
            Get.toNamed(Routes.CONFIRM);
            Helper.errorSnackBar("خطأ", "من فضلك قم بإدخال كود التفعيل أولا");
          }else {
            box.write("currentUser", value['user']);
            box.write("access_token", value['access_token']);
            Get.offAllNamed(Routes.HOME);
          }
        }else {
          Helper.errorSnackBar("خطأ", value['message']);
        }
        isLoading.value = false;
      });
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
    }else if (mobileNumberController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل رقم الموبايل");
    }else if(walletAddressController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل عنوان المحفظة");
    }
    else {
      isLoading.value = true;
     await AuthProvider().register(
        phone: mobileNumberController.text,
        country_id: "1",
        email: emailController.text,
        full_name: fullNameController.text,
        password: passwordController.text,
        wallet_address: walletAddressController.text
      ).then((value) {
        if(value['status'] == 0) {
          Helper.errorSnackBar("خطأ", value['message']['email'][0]);
        } else {
          Helper.successSnackBar("جيد", value['message']);
        }
      });
      isLoading.value = false;
    }
  }



  // Reset Password
  Future resetPassword() async {
  if(emailController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل البريد الألكتروني");
    } else if(!GetUtils.isEmail(emailController.text)) {
      Helper.errorSnackBar("خطأ", "من فضلك تأكد من صحة البريد الألكتروني");
    } else {
    isLoading.value = true;
  await  AuthProvider().resetPassword(email: emailController.text).then((value) {
      if(value['status'] == 0) {
        Helper.errorSnackBar("خطأ", value['message']);
      }else {
        Get.back();
        Helper.successSnackBar("جيد", value['message']);
      }
    });
    isLoading.value = false;
      // Do Login Here

      // Get.defaultDialog(
      //   titleStyle: TextStyle(height: 0.0),
      //   radius: 5.0,
      //   title: "",
      //   content: Padding(
      //     padding: const EdgeInsets.all(5.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Container(
      //           child: GestureDetector(
      //             onTap: (){
      //               Get.back();
      //             },
      //             child: Icon(Icons.close,color: mainColor,),
      //           ),
      //           alignment: Alignment.topLeft,
      //         ),
      //         SizedBox(height: 20.0,),
      //         Icon(Icons.verified,size: 60,color: mainColor,),
      //         SizedBox(height: 20,),
      //         CustomText(
      //           textFontWeight: FontWeight.bold,
      //           textColor: mainColor,
      //           textTextAlign: TextAlign.center,
      //           text: "تم إرسال كلمة المرور إلي البريد الألكتروني . برجاء التحقيق وتسجيل الدخول مرة أخري",
      //         )
      //       ],
      //     ),
      //   ),
      // );
    }
  }



  // Verify Account
  Future verifyAccount() async {
    if(confirmCodeController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل كود التفعيل");
    }else {
      await AuthProvider().verifyAccount(user_id: user.id,verify_code: confirmCodeController.text).then((value) {
        if(value['status'] == 0) {
          Helper.errorSnackBar("خطأ", value['message']);
        } else {
          Helper.successSnackBar("جيد", value['message']);
          // Save User To His Model
          user = User.fromJSON(value['user']);
          box.remove("currentUser");
          box.write("currentUser", value['user']);
        }
      });
    }
  }


  // Get All Countries
  Future getAllCountries() async {
    await AuthProvider().getAllCountries().then((value) {
      print("RRRRRR ${value}");
    });
  }


}