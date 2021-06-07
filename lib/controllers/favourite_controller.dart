
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
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavouriteList();
  }


  // Get Favourite List
  Future getFavouriteList() async {
    isLoading.value = true;
    await FavouriteProvider().getFavouriteList(user_id: box.read("currentUser")['id'].toString()).then((value) {
      if(value['status'] == 1) {
        favList.value = value['fav'];
      }
    });
    isLoading.value = false;
  }


  // Add Offer To Favourite
  Future addToFavourite({offer_id}) async {
    isLoading.value = true;
    await FavouriteProvider().addToFavourite(user_id: box.read("currentUser")['id'].toString(),offer_id: offer_id).then((value) {
      print("VVVVVVVVVVVVVVVVVVVVVVVV ${value}");
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
      }
    });
    isLoading.value = false;
  }


  // Delete Offer From Favourite
  Future deleteFromFavourite({offer_id}) async {
    isLoading.value = true;
    await FavouriteProvider().deleteFromFavourite(offer_id: offer_id).then((value) {
      print("VVVVVVVVVVVVVVVVVVVVVVVV ${value}");
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
      }
    });
    isLoading.value = false;
  }

}
