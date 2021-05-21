
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/views/auth_screen.dart';
import 'package:get/get.dart';

class AppPages {

  static const INITIAL = Routes.LOGIN;

  static final routes = <GetPage<dynamic>>[
     GetPage(name: Routes.LOGIN, page: () => AuthScreen()),
  ];
}