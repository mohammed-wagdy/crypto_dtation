
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/providers/general_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GeneralController extends GetxController {

  RxBool isLoading = false.obs;
  RxString aboutText = "".obs;
  RxString privacyText = "".obs;
  RxString TermsText = "".obs;
  TextEditingController emaiController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  // Privacy
  Future getPrivacy() async {
    isLoading.value = true;
    await GeneralProvider().getPrivacy().then((value) {
      if(value['status'] == 1) {
        if(value['privacy'].length > 0) {
          privacyText.value = value['privacy'][0]["text"];
        }
      }
    });
    isLoading.value = false;
  }


  // Contact Us
  Future contactUs() async {
    isLoading.value = true;
   if(emaiController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل البريد الألكتروني");
    }else if(phoneController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل رقم الموبايل");
    }else if(subjectController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل موضوع الرسالة");
    }else if(messageController.text.isEmpty) {
     Helper.errorSnackBar("خطأ", "من فضلك أدخل نص الرسالة");
    } else {
   await  GeneralProvider().contactUs(
       phone: phoneController.text,
       email: emaiController.text,
       message: messageController.text,
       subject: subjectController.text
     ).then((value) {
       if(value['status'] == 1) {
         phoneController.text = "";
         emaiController.text = "";
         messageController.text = "";
         subjectController.text = "";
         Helper.successSnackBar("جيد", value['message']);
       }
     });
     isLoading.value = false;
   }
  }

  // About
  Future getAboutUs() async {
    isLoading.value = true;
    await GeneralProvider().getAboutUs().then((value) {
      if(value['status'] == 1) {
        if(value['about'].length > 0) {
          aboutText.value = value['about'][0]["text"];
        }
      }
    });
   isLoading.value = false;
  }


  // Terms And Conditions
  Future getTermsAndConditions() async {
    isLoading.value = true;
    await GeneralProvider().getTermsAndConditions().then((value) {
      print("MMMMMMMMMMMMMMMM ${value}");
      if(value['status'] == 1) {
        if(value['license'].length > 0) {
          TermsText.value = value['license'][0]["text"];
        }
      }
    });
    isLoading.value = false;
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAboutUs();
  }

}
