
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:get/get.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => FavouriteController());
    Get.lazyPut(() => HomeController());
  }
}