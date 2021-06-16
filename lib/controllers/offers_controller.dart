
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

class OffersController extends GetxController {

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
  await getSpecialOffers(page: 1);
   await getUserData();
  }


  // Get User Data
   getUserData() {
    // Get User Data From Memory ...
    user.value = User.fromJSON(box.read("currentUser"));
  }


  // Add Offer
  Future addOffer() async {
    if(sell_type.value == false && buy_type.value == false) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بإختيار حالة العرض أولا");
    }else if(paymentTypeController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بإختيار طريقة الدفع أولا");
    } else if(countrySelect == null) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بإختيار الدولة أولا");
    }else if(quantityController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بإختيار الكمية أولا");
    }else if(lowQuantitycontroller.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بإختيار سعر الصرف أولا");
    }else if(payPriceController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بإختيار أقل كمية أولا");
    }else {
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
       //   Get.find<HomeController>().getHomePageAllOffers();
          Helper.successSnackBar("جيد", value['message']);
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

  }


  // Edit Offer
  Future updateOffer({offer_id}) async {
    if(sell_type.value == false && buy_type.value == false) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بتعديل حالة العرض أولا");
    }else if(paymentTypeController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بتعديل طريقة الدفع أولا");
    } else if(countrySelect == null) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بتعديل الدولة أولا");
    }else if(quantityController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بتعديل الكمية أولا");
    }else if(lowQuantitycontroller.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بتعديل سعر الصرف أولا");
    }else if(payPriceController.text.isEmpty) {
      Helper.errorSnackBar("خطأ", "من فضلك قم بتعديل أقل كمية أولا");
    }else {
      isLoading.value = true;
      await OffersProvider().updateOffer(
          offer_id: offer_id,
          user_id: user.value.id,
          country_id: countrySelect.toString(),
          low_quantity: lowQuantitycontroller.text,
          pay_price: payPriceController.text,
          quantity: quantityController.text,
          payment_type: paymentTypeController.text,
          type: sell_type.value == false ? "pay" : "sale"
      ).then((value) {
        if(value['status'] == 1) {
          Get.find<ProfileController>().getOffersCount();
          Helper.successSnackBar("جيد", value['message']);

          // offer = Offer.fromJSON(value['offer']);
          // Helper.successSnackBar("جيد", value['message']);
       //   Get.find<HomeController>().getHomePageAllOffers();
        }else {
          Helper.errorSnackBar("خطأ", value['message']);
        }
        isLoading.value = false;

      });
    await  Get.find<ProfileController>().getOffersCount();
      Get.toNamed(Routes.ALL_USER_OFFERS);
    }
  }


  // Get Offers With Search
  Future getOffersWithFilter({search_val}) async {
    isLoading.value = true;
    await OffersProvider().getOffersWithFilter(search_val:search_val).then((value) {
      if(value['status'] == 1) {
        print("FMFMFSEWEW ${value['offers']['data']}");
        filteredOffers.value = value['offers']['data'];
      }
    });
    isLoading.value = false;
  }



  // Get All Offers
  Future getAllOffers() async {
    isLoading.value = true;
    await OffersProvider().getAllOffers().then((value) {
      if(value['status'] == 1) {
        filteredOffers.value = value['offers']['data'];
      }
    });
    isLoading.value = false;
  }



  // Get Offers With Search
  Future getMyOffersWithFilter({search_val,user_id}) async {
    isLoading.value = true;
    await OffersProvider().getMyOffersWithFilter(search_val:search_val,user_id: user_id).then((value) {
      if(value['status'] == 1) {
        filteredOffers.value = value['offers']['data'];
      }
    });
    isLoading.value = false;
  }




  // Get My Offers
  Future getMyOffers({user_id}) async {
    isLoading.value = true;
    await OffersProvider().getMyOffers(user_id:user_id).then((value) {
      if(value['status'] == 1) {
        print("MY OFFERS ${value['offers']['data']}");
        filteredOffers.value = value['offers']['data'];
      }
    });
    isLoading.value = false;
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






  // Get Finished Offers
  Future getFinishedOffers({page}) async {
    isLoading.value = true;
    await HomeProvider().getFinishedOffers(page: page).then((value) {
      allFinishedOfersData.value = value['offers']['data'];
    });
    isLoading.value = false;
  }


  // Get Pending Offers
  Future getPendingOffers({page}) async {
    isLoading.value = true;
    await HomeProvider().getPendingOffers(page: page).then((value) {
      allPendingOfersData.value = value['offers']['data'];
    });
    isLoading.value = false;
  }


  // Get Special Offers
  Future getSpecialOffers({page}) async {
    isLoading.value = true;
    await HomeProvider().getspecialdOffers(page: page).then((value) {
      allUserOfersData.value = value['offers']['data'];
    });
    isLoading.value = false;
  }



  void onRefreshAllUsers() async {
    pageSpecial.value = 1;
    await HomeProvider().getspecialdOffers(page: pageSpecial.value ).then((value) {
      allUserOfersData.value = value['offers']['data'];
    });
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }


  void onLoadingAllUsers() async {
    pageSpecial.value ++;
    await HomeProvider().getspecialdOffers(page: pageSpecial.value).then((value) {
      allUserOfersData.value = [...allUserOfersData.value , ...value['offers']['data']];
    });
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }




  void onRefreshFinished() async {
    pageFinished.value = 1;
    await HomeProvider().getspecialdOffers(page: pageFinished.value ).then((value) {
      allFinishedOfersData.value = value['offers']['data'];
    });
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }


  void onLoadingAllFinished() async {
    pageFinished.value ++;
    await HomeProvider().getspecialdOffers(page: pageFinished.value).then((value) {
      allFinishedOfersData.value = [...allFinishedOfersData.value , ...value['offers']['data']];
    });
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }



  void onRefreshPending() async {
    pagePending.value = 1;
    await HomeProvider().getspecialdOffers(page: pagePending.value ).then((value) {
      allPendingOfersData.value = value['offers']['data'];
    });
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }


  void onLoadingAllPending() async {
    pagePending.value ++;
    await HomeProvider().getspecialdOffers(page: pagePending.value).then((value) {
      allPendingOfersData.value = [...allPendingOfersData.value , ...value['offers']['data']];
    });
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }



  void onRefreshOffersFilters() async {
    pageMy.value = 1;
    await OffersProvider().getMyOffers(page: pageMy.value,user_id: box.read("currentUser")['id'].toString()).then((value) {
      filteredOffers.value = value['offers']['data'];
    });

    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }


  void onLoadingAllOffersFilters() async {
    pageMy.value ++;
    await OffersProvider().getMyOffers(page: pageMy.value,user_id: box.read("currentUser")['id'].toString()).then((value) {
      filteredOffers.value = [...filteredOffers.value , ...value['offers']['data']];
    });

    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }


  void onRefreshOffersFiltersAll() async {
    pageAll.value = 1;
    await OffersProvider().getAllOffers(page: 1).then((value) {
      filteredOffers.value = value['offers']['data'];
    });
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }


  void onLoadingAllOffersFiltersAll() async {
    pageAll.value ++;
    await OffersProvider().getAllOffers(page: pageAll.value).then((value) {
      filteredOffers.value = [...filteredOffers.value , ...value['offers']['data']];
    });

    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.loadComplete();
  }


}
