
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/home_offers_slider_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/providers/favourite_providers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouriteController extends GetxController {

  RxBool isGrid = false.obs;
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  RxList favList = [].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
   await getFavouriteList();
  }


  // Get Favourite List
  Future getFavouriteList() async {
    isLoading.value = true;
    await FavouriteProvider().getFavouriteList(user_id: box.read("currentUser")['id'].toString()).then((value) {
      if(value['status'] == 1) {
        favList.value = value['fav'];
        print("FMFMFEKREKRKE ${value['fav'].length}");
        print("FMFMFEKREKRKE ${value['fav']}");
      }
    });
    isLoading.value = false;
  }


  // Add Offer To Favourite
  Future addToFavourite({offer_id}) async {
    print("FMFMMMM ${box.read("currentUser")['id'].toString()}");
    print("FMFMMMM ${offer_id}");
    isLoading.value = true;
    await FavouriteProvider().addToFavourite(user_id: box.read("currentUser")['id'].toString(),offer_id: offer_id).then((value) {
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
        Get.find<HomeController>().getHomePageAllOffers();
        Get.find<OffersController>().getAllOffers();
        Get.find<OffersController>().getMyOffers();
        Get.find<HomeOffersSliderController>().getPendingOffers(page: 1);
        Get.find<HomeOffersSliderController>().getFinishedOffers(page: 1);
        Get.find<HomeOffersSliderController>().getSpecialOffers(page: 1);
        Get.find<ProfileController>().getOrdersRequestsCount();
        Get.find<ProfileController>().getOffersCount();
        Get.find<ProfileController>().getOrdersCount();

      }
    });
    isLoading.value = false;
  }


  // Delete Offer From Favourite
  Future deleteFromFavourite({offer_id}) async {
    print("FMFMFFMFMMF ${offer_id}");
    isLoading.value = true;
    await FavouriteProvider().deleteFromFavourite(offer_id: offer_id).then((value) {
      print("FMFMFFMFMMF ${value}");
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
        getFavouriteList();
        Get.find<HomeController>().getHomePageAllOffers();
        Get.find<OffersController>().getAllOffers();
        Get.find<OffersController>().getMyOffers();
        Get.find<HomeOffersSliderController>().getPendingOffers(page: 1);
        Get.find<HomeOffersSliderController>().getFinishedOffers(page: 1);
        Get.find<HomeOffersSliderController>().getSpecialOffers(page: 1);
        Get.find<ProfileController>().getOrdersRequestsCount();
        Get.find<ProfileController>().getOffersCount();
        Get.find<ProfileController>().getOrdersCount();
      }
    });
    isLoading.value = false;
  }

}
