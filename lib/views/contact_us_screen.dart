import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends GetView<HomeController> {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "تواصل معنا",
            drawerKey: controller.scaffoldKey,
          )),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "أرسل لنا أستفسارك أو أقتراحك أو شكواك",
                textSize: 17,
                textColor: mainColor,
                textFontWeight: FontWeight.w600,
              ),

              SizedBox(height: 20,),

              CustomTextFormField(
                  textLabel: "البريد الألكتروني",
                  textController: emailController,
                  keyboardType: TextInputType.emailAddress),

              SizedBox(height: 10,),

              CustomTextFormField(
                  textLabel: "رقم الجوال",
                  textController: phoneController,
                  keyboardType: TextInputType.number),

              SizedBox(height: 10,),

              CustomTextFormField(
                  textLabel: "موضوع الرسالة",
                  textController: titleController,
                  keyboardType: TextInputType.text),

              SizedBox(height: 10,),

              CustomTextFormField(
                isTextArea: true,
                  textLabel: "نص الرسالة",
                  textController: subjectController,
                  keyboardType: TextInputType.text),

              SizedBox(height: 30,),

              Container(
                width: double.infinity,
                child: CustomButton(
                  buttonText: "إرسال",
                  buttonTextSize: 17.0,
                  buttonTextFontWeight: FontWeight.w700,
                  buttonOnPress: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
