
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:get/get.dart';

class OffersBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OffersController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
  }
}