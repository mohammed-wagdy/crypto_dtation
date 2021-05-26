
import 'package:crypto_station/bindings/auth_binding.dart';
import 'package:crypto_station/bindings/home_binding.dart';
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/views/about_us_screen.dart';
import 'package:crypto_station/views/auth_screen.dart';
import 'package:crypto_station/views/confirm_code_screen.dart';
import 'package:crypto_station/views/contact_us_screen.dart';
import 'package:crypto_station/views/home_screen.dart';
import 'package:crypto_station/views/notifications_screen.dart';
import 'package:crypto_station/views/privacy_policy_screen.dart';
import 'package:crypto_station/views/search_resault.dart';
import 'package:crypto_station/views/terms_and_conditions_screen.dart';
import 'package:get/get.dart';

class AppPages {

  static const INITIAL = Routes.REUST_PAGE;

  static final routes = <GetPage<dynamic>>[
     GetPage(name: Routes.LOGIN    , page: () => AuthScreen()          , binding: AuthBinding()),
     GetPage(name: Routes.HOME     , page: () => HomeScreen()          , binding: HomeBinding()),
     GetPage(name: Routes.CONTACT  , page: () => ContactUs()           , binding: HomeBinding()),
     GetPage(name: Routes.ABOUT    , page: () => AboutUs()             , binding: HomeBinding()),
     GetPage(name: Routes.TERMS    , page: () => TermsAndConditions()  , binding: HomeBinding()),
     GetPage(name: Routes.PRIVACY  , page: () => PrivacyAndPolicy()    , binding: HomeBinding()),
     GetPage(name: Routes.CONFIRM  , page: () => ConfirmCodeScreen()   , binding: HomeBinding()),
     GetPage(name: Routes.NOTIFICATIONS  , page: () => NotificationScreen()   , binding: HomeBinding()),
     GetPage(name: Routes.REUST_PAGE  , page: () => SearchResultScreen()   , binding: HomeBinding()),
  ];
}