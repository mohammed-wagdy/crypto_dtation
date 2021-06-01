
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/models/offer.dart';
import 'package:crypto_station/models/user.dart';
import 'package:crypto_station/providers/offer_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OffersController extends GetxController {

  RxBool isGrid = false.obs;
  RxBool selectMyOffers = true.obs;
  Rx<User> user = User().obs;
  Offer offer = new Offer();
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  // Add Offer Attr
  TextEditingController paymentTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController payPriceController = TextEditingController();
  TextEditingController lowQuantitycontroller = TextEditingController();
  RxBool sell_type = false.obs;
  RxBool buy_type = false.obs;


  @override
  void onInit() {
    super.onInit();
    getUserData();
  }


  // Get User Data
   getUserData() {
    // Get User Data From Memory ...
    user.value = User.fromJSON(box.read("currentUser"));
  }


  // Add Offer
  Future addOffer() async {
    isLoading.value = true;
   await OffersProvider().addOffer(
      user_id: user.value.id,
      country_id: user.value.countryId,
      low_quantity: lowQuantitycontroller.text,
      pay_price: payPriceController.text,
      quantity: quantityController.text,
      payment_type: paymentTypeController.text,
      type: sell_type.value == false ? "pay" : "sale"
    ).then((value) {
      if(value['status'] == 1) {
        offer = Offer.fromJSON(value['offer']);
       // Helper.successSnackBar("جيد", value['message']);
        Get.find<ProfileController>().getOffersCount();
        paymentTypeController.text = "";
        payPriceController.text = "";
        quantityController.text = "";
        lowQuantitycontroller.text= "";
        buy_type.value = false;
        sell_type.value = false;
      }else {
        Helper.errorSnackBar("خطأ", value['message']);
      }
      isLoading.value = false;
      print("FDFDIIDFIDISODSDJDWK ${value}");
    });
  }

}
