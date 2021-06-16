
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/models/offer.dart';
import 'package:crypto_station/models/user.dart';
import 'package:crypto_station/providers/home_providers.dart';
import 'package:crypto_station/providers/offer_providers.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AdvancedSearchController extends GetxController {

  RxBool isGrid = false.obs;
  RxBool selectMyOffers = true.obs;
  Rx<User> user = User().obs;
  Offer offer = new Offer();
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  RxInt pageMy = 1.obs;
  RxInt pageAll = 1.obs;
  RxInt searchFilterOfferPage = 1.obs;
  // Add Offer Attr
  TextEditingController paymentTypeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController payPriceController = TextEditingController();
  TextEditingController lowQuantitycontroller = TextEditingController();
  RxBool sell_type = false.obs;
  RxBool buy_type = false.obs;
  RxList filteredOffers = [].obs;
  RxList allOffersAfterAdvancedFilter = [].obs;



  RefreshController refreshController = RefreshController(initialRefresh: false);

  RxList allFinishedOfersData = [].obs;
  RxList allPendingOfersData = [].obs;
  RxList allUserOfersData = [].obs;

  RxInt pageSpecial = 1.obs;
  RxInt pageFinished = 1.obs;
  RxInt pagePending = 1.obs;
  // search attr
  TextEditingController userNameController = TextEditingController();
  RxBool search_sell_type = false.obs;
  RxBool search_buy_type = false.obs;
  RxBool today_day = false.obs;
  var countrySelect;
  RxBool search_small_to_big = false.obs;
  RxBool search_big_to_small = false.obs;


  @override
  void onInit() async {
    super.onInit();
  }



  // advanced search
  Future advancedSearch({page}) async {
    print("HJKGLFKD${userNameController.text}");
    print("HJKGLFKD ${search_sell_type}");
    print("HJKGLFKD ${search_buy_type}");
    print("HJKGLFKD ${search_small_to_big}");
    print("HJKGLFKD ${search_big_to_small}");
    print("HJKGLFKD ${countrySelect}");
    print("HJKGLFKD ${today_day}");

    isLoading.value = true;
    await OffersProvider().advancedSearch(
      page: searchFilterOfferPage.value,
      name: userNameController.text,
      type: search_sell_type.value == false && search_buy_type.value == false  ? " " : search_sell_type.value == false ? "pay" : "sale",
      country_id: countrySelect == null ? " " : countrySelect.toString(),
      today_day: today_day.value == false ? " " : "1",
      quantity: search_small_to_big.value == false && search_big_to_small.value == false  ? " " : search_small_to_big.value == false ? "1" : "2",
    ).then((value) {
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
        allOffersAfterAdvancedFilter.value = value['offers']['data'];
        Get.toNamed(Routes.SEARCH_RESULT);
      }
    });
    isLoading.value = false;
  }



  void onRefreshSearchedFilterOffers() async {
    searchFilterOfferPage.value = 1;
    await OffersProvider().advancedSearch(
      page: searchFilterOfferPage.value,
      name: userNameController.text,
      type: search_sell_type.value == false && search_buy_type.value == false  ? " " : search_sell_type.value == false ? "pay" : "sale",
      country_id: countrySelect == null ? " " : countrySelect.toString(),
      today_day: today_day.value == false ? " " : "1",
      quantity: search_small_to_big.value == false && search_big_to_small.value == false  ? " " : search_small_to_big.value == false ? "1" : "2",
    ).then((value) {
      if(value['status'] == 1) {
        print("VMVDFPEDEL ${value}");
        allOffersAfterAdvancedFilter.value = value['offers']['data'];
      }
    });
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }


  void onLoadingSearchedFilterOffers() async {
    searchFilterOfferPage.value ++;
    print("VMVDFPEDEL ${searchFilterOfferPage.value}");
   await OffersProvider().advancedSearch(
      page: searchFilterOfferPage.value,
      name: userNameController.text,
      type: search_sell_type.value == false && search_buy_type.value == false  ? " " : search_sell_type.value == false ? "pay" : "sale",
      country_id: countrySelect == null ? " " : countrySelect.toString(),
      today_day: today_day.value == false ? " " : "1",
      quantity: search_small_to_big.value == false && search_big_to_small.value == false  ? " " : search_small_to_big.value == false ? "1" : "2",
    ).then((value) {
      if(value['status'] == 1) {
        print("VMVDFPEDEL ${value}");
        print("VMVDFPEDEL ${allOffersAfterAdvancedFilter.value.length}");
        allOffersAfterAdvancedFilter.value = [...allOffersAfterAdvancedFilter.value , ...value['offers']['data']];
        print("VMVDFPEDEL ${allOffersAfterAdvancedFilter.value.length}");
      }
    });
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }

}
