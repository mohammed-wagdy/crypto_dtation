import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          bottom: true,
          top: true,
          child: Column(
            children: [
              Image.network("https://cdn.dribbble.com/users/6623125/screenshots/14841425/crypto_4x.png",height: 150,),
              TabBar(
                indicator: BoxDecoration(
                  border: Border(bottom: BorderSide(color: mainColor,width: 3)),
                ),
                labelColor: mainColor,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Tajawal"
                ),
                unselectedLabelColor: blackColor,
                tabs: [
                  Tab(
                    text: "تسجيل الدخول",
                  ),
                  Tab(
                    text: "تسجيل جديد",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Login
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "مرحبا بك",
                              textFontWeight: FontWeight.bold,
                              textSize: 18.0,
                              textColor: blackColor,
                            ),
                            SizedBox(height: 20.0,),
                            CustomTextFormField(
                              textLabel: "البريد الألكتروني",
                              keyboardType: TextInputType.emailAddress,
                              textController: controller.emailController,
                            ),
                            SizedBox(height: 20.0,),
                            CustomTextFormField(
                              textLabel: "كلمة المرور",
                              keyboardType: TextInputType.text,
                              isSecure: true,
                              textController: controller.passwordController,
                            ),
                            SizedBox(height: 10.0,),

                            Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  side: BorderSide(color: textLabelColor),
                                  activeColor: mainColor,
                                  onChanged: (val) {
                                    controller.changeRememberMe(val);
                                  },
                                  value: controller.rememberMe.value,
                                ),
                                CustomText(
                                  text: "حفظ البيانات للدخول لاحقا",
                                  textColor: textLabelColor,
                                  textSize: 14.0,
                                  textFontWeight: FontWeight.w500,
                                )
                              ],
                            ),),

                            SizedBox(height: 20.0,),

                            Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: (){
                                    Get.defaultDialog(

                                      titleStyle: TextStyle(height: 0.0),
                                      radius: 5.0,
                                      title: "",
                                      content: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
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
                                              Image.network("https://cdn.dribbble.com/users/6623125/screenshots/14841425/crypto_4x.png",height: 65,),
                                              SizedBox(height: 15.0,),
                                              CustomTextFormField(
                                                textLabel: "البريد الألكتروني",
                                                keyboardType: TextInputType.emailAddress,
                                                textController: controller.emailController,
                                              ),
                                              SizedBox(height: 15.0,),
                                              Container(
                                                width: double.infinity,
                                                child: CustomButton(
                                                  buttonText: "إستعادة كلمة المرور",
                                                  buttonTextSize: 17.0,
                                                  buttonTextFontWeight: FontWeight.w700,
                                                  buttonOnPress: () {
                                                    controller.resetPassword();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                },
                                child: CustomText(
                                  text: "هل نسيت كلمة المرور ؟!",
                                  textColor: mainColor,
                                  textSize: 14.0,
                                  textFontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            SizedBox(height: 20.0,),
                            Container(
                              width: double.infinity,
                              child: CustomButton(
                                buttonText: "الدخول",
                                buttonTextSize: 17.0,
                                buttonTextFontWeight: FontWeight.w700,
                                buttonOnPress: () {
                                  controller.login();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    // Register
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              textLabel: "الأسم بالكامل",
                              keyboardType: TextInputType.text,
                              textController: controller.fullNameController,
                            ),
                            SizedBox(height: 20.0,),
                            CustomTextFormField(
                              textLabel: "البريد الألكتروني",
                              keyboardType: TextInputType.emailAddress,
                              textController: controller.emailController,
                            ),
                            SizedBox(height: 20.0,),
                            CustomTextFormField(
                              textLabel: "كلمة المرور",
                              keyboardType: TextInputType.text,
                              isSecure: true,
                              textController: controller.passwordController,
                            ),

                            SizedBox(height: 40.0,),
                            Container(
                              width: double.infinity,
                              child: CustomButton(
                                buttonText: "التسجيل",
                                buttonTextSize: 17.0,
                                buttonTextFontWeight: FontWeight.w700,
                                buttonOnPress: () {
                                  controller.register();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
