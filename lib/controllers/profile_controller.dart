
import 'dart:io';

import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/models/offer.dart';
import 'package:crypto_station/models/user.dart';
import 'package:crypto_station/providers/auth_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ProfileController extends GetxController {

  TextEditingController searchInput = TextEditingController();
  Rx<User> user = User().obs;
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController walletAddressController = TextEditingController();

  TextEditingController quantityController = TextEditingController();
  TextEditingController lessQuantityController = TextEditingController();
  TextEditingController payPriceController = TextEditingController();


  RxString imageUrl = "".obs;
  File? file;
  RxInt offerCount = 0.obs;
  RxInt orderCount = 0.obs;
  RxInt orderRequestCount = 0.obs;
  RxList rates = [].obs;
  RxList allOffers = [].obs;
  RxList allOrders = [].obs;
  RxList allRequests = [].obs;

  // For Pick Image
  PickedFile? imageFile;
  final picker = ImagePicker();
  GetStorage box = GetStorage();
  // Get Image From Camera
  imgFromCamera() async {
    final pickedFile = picker.getImage(source: ImageSource.camera,imageQuality: 50);
    pickedFile.then((value){
      imageFile = value;
      file = File(imageFile!.path);
    });
  }

  // Get Image From Gallery
  imgFromGallery() async {
    final pickedFile = picker.getImage(source: ImageSource.gallery,imageQuality: 50);
    pickedFile.then((value){
      imageFile = value;
      file = File(imageFile!.path);
    });
  }


  // Get User Data
  Future getUserData() async {
    // Get User Data From Memory ...
    user.value = User.fromJSON(box.read("currentUser"));
    emailController.text = user.value.email.toString();
    mobileController.text = user.value.phone.toString();
    walletAddressController.text = user.value.walletAddress.toString();
    fullNameController.text = user.value.fullName.toString();
  }


  // Update User Data
  Future updateUserData() async {
    if(mobileController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل رقم الموبايل");
    }else if(walletAddressController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك أدخل عنوان المحفظة");
    }else {

      isLoading.value = true;
    await  AuthProvider().updateUserData(
          password: passwordController.text,
          wallet_address: walletAddressController.text,
          user_id: user.value.id,
          country_id: "1",
          full_name: fullNameController.text,
          image_url: file,
          phone: mobileController.text
      ).then((value) {
        if(value['status'] == 1) {
          user.value = User.fromJSON(value['user']);
          box.write("currentUser", value['user']);
          Get.back();
          Helper.successSnackBar("جيد", value['message']);
        }else {
          Helper.errorSnackBar("خطأ", value['message']);
        }
      });
    }
  }



  // Get Offers Count
  Future getOffersCount() async {
    isLoading.value = true;
    await AuthProvider().getOffersCount(user_id: user.value.id).then((value) {
      offerCount.value = value['count'];
      print("FOFOFOOOOO ${value['offers']}");
      allOffers.value = value['offers'];
    });
    isLoading.value = false;
  }



  // Get Orders Count
  Future getOrdersCount() async {
    isLoading.value = true;
    await AuthProvider().getOrdersCount(user_id: user.value.id).then((value) {
      orderCount.value = value['count'];
      allOrders.value = value['offers'];
      print("FOOOO 3 ${box.read("access_token")}");
    });
    isLoading.value = false;
  }


  // Get Requests Count
  Future getOrdersRequestsCount() async {
    isLoading.value = true;
    await AuthProvider().getOrdersRequestsCount(user_id: user.value.id).then((value) {
      orderRequestCount.value = value['count'];
      allRequests.value = value['offers'];
    });
    isLoading.value = false;
  }

  // Get Rates Of My Profile
  Future getRates() async {
    isLoading.value = true;
    await AuthProvider().getRates(user_id: user.value.id).then((value) {
      rates.value = value['rates'];
    });
    isLoading.value = false;
  }


  // Delete Offer
  Future deleteOffer({offer_id}) async {
    isLoading.value = true;
    await AuthProvider().deleteOffer(offer_id: offer_id).then((value) {
      if(value['status'] == 1) {
        Get.back();
        Helper.successSnackBar("جيد", value['message']);
        getOffersCount();
      }

    });
    isLoading.value = false;
  }





  @override
  void onInit() {
    super.onInit();
    getUserData();
    getOffersCount();
    getOrdersCount();
    getOrdersRequestsCount();
    getRates();
  }

}
