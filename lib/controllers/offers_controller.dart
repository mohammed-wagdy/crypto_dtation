
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/models/offer.dart';
import 'package:crypto_station/models/user.dart';
import 'package:crypto_station/providers/offer_providers.dart';
import 'package:crypto_station/routes/app_routes.dart';
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
  RxList filteredOffers = [].obs;
  RxList allOffersAfterAdvancedFilter = [].obs;


  // search attr
  TextEditingController userNameController = TextEditingController();
  RxBool search_sell_type = false.obs;
  RxBool search_buy_type = false.obs;
  RxBool today_day = false.obs;
  var countrySelect;
  RxBool search_small_to_big = false.obs;
  RxBool search_big_to_small = false.obs;


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
        Get.find<HomeController>().getHomePageAllOffers();
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
    });
  }


  // Get Offers With Search
  Future getOffersWithFilter({search_val}) async {
    isLoading.value = true;
    await OffersProvider().getOffersWithFilter(search_val:search_val).then((value) {
      if(value['status'] == 1) {
        print("VOVOVOVVOVOV ${value}");
        filteredOffers.value = value['offer'];
      }
    });
    isLoading.value = false;
  }


  // advanced search
  Future advancedSearch() async {
    print("HJKGLFKD ${userNameController.text}");
    print("HJKGLFKD ${search_sell_type}");
    print("HJKGLFKD ${search_buy_type}");
    print("HJKGLFKD ${search_small_to_big}");
    print("HJKGLFKD ${search_big_to_small}");
    print("HJKGLFKD ${countrySelect}");
    print("HJKGLFKD ${today_day}");

    isLoading.value = true;
    await OffersProvider().advancedSearch(
        name: userNameController.text,
        type: search_sell_type.value == false ? "pay" : "sale",
        country_id: countrySelect.toString(),
          today_day: today_day.value ? "1" : "0",
      quantity: search_small_to_big.value == false ? "1" : "2",
    ).then((value) {
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
        allOffersAfterAdvancedFilter.value = value['offers'];
        Get.toNamed(Routes.SEARCH_RESULT , arguments:allOffersAfterAdvancedFilter.value);
      }
      print("VOVOVOVVOVOV ${value}");
    });
    isLoading.value = false;
  }

}
