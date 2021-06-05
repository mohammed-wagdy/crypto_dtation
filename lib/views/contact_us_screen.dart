import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/general_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends GetView<GeneralController> {

  GeneralController controller = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            appBarTitle: "تواصل معنا",
            drawerContext: context,
          )),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(child: Image.asset("assets/images/constactUs.png",height: 200,)),

              CustomText(
                text: "أرسل لنا أستفسارك أو أقتراحك أو شكواك",
                textSize: 17,
                textColor: mainColor,
                textFontWeight: FontWeight.w600,
              ),

              SizedBox(height: 20,),


              // Email
              CustomTextFormField(
                  textLabel: "البريد الألكتروني",
                  textController: controller.emaiController,
                  keyboardType: TextInputType.emailAddress),

              SizedBox(height: 10,),

              // phone
              CustomTextFormField(
                  textLabel: "رقم الجوال",
                  textController: controller.phoneController,
                  keyboardType: TextInputType.number),

              SizedBox(height: 10,),


              // Subject
              CustomTextFormField(
                  textLabel: "موضوع الرسالة",
                  textController: controller.subjectController,
                  keyboardType: TextInputType.text),

              SizedBox(height: 10,),


              // Message
              CustomTextFormField(
                  isTextArea: true,
                  textLabel: "نص الرسالة",
                  textController: controller.messageController,
                  keyboardType: TextInputType.text),

              SizedBox(height: 30,),

              controller.isLoading.value ? Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 30,)) :
              Container(
                width: double.infinity,
                child: CustomButton(
                  buttonText: "إرسال",
                  buttonTextSize: 17.0,
                  buttonTextFontWeight: FontWeight.w700,
                  buttonOnPress: () {
                    controller.contactUs();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
