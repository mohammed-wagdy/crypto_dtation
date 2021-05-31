
import 'dart:io';

import 'package:crypto_station/helper.dart';
import 'package:crypto_station/models/user.dart';
import 'package:crypto_station/providers/auth_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {

  TextEditingController searchInput = TextEditingController();
  User user = User();
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController walletAddressController = TextEditingController();

  // For Pick Image
  PickedFile? imageFile;
  final picker = ImagePicker();
  GetStorage box = GetStorage();
  // Get Image From Camera
  imgFromCamera() async {
    final pickedFile = picker.getImage(source: ImageSource.camera,imageQuality: 50);
    pickedFile.then((value){
      imageFile = value;
    });
  }

  // Get Image From Gallery
  imgFromGallery() async {
    final pickedFile = picker.getImage(source: ImageSource.gallery,imageQuality: 50);
    pickedFile.then((value){
      imageFile = value;
    });
  }


  // Get User Data
  Future getUserData() async {
    // Get User Data From Memory ...
    box.read("currentUser");
    user = User.fromJSON(box.read("currentUser"));
    emailController.text = user.email.toString();
    mobileController.text = user.phone.toString();
    walletAddressController.text = user.walletAddress.toString();
  }


  Future updateUserData() async {
    if(mobileController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل رقم الموبايل");
    }else if(walletAddressController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل عنوان المحفظة");
    }else {

      isLoading.value = true;
      AuthProvider().updateUserData(
          password: passwordController.text,
          wallet_address: walletAddressController.text,
          user_id: user.id,
          phone: mobileController.text).then((value) {
        print("rereererreerreer ${value}");
      });
    }
  }


  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

}
