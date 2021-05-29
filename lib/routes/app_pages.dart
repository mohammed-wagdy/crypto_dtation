
import 'package:crypto_station/bindings/auth_binding.dart';
import 'package:crypto_station/bindings/favourite_binding.dart';
import 'package:crypto_station/bindings/home_binding.dart';
import 'package:crypto_station/bindings/offers_binding.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/views/about_us_screen.dart';
import 'package:crypto_station/views/advanced_search_screen.dart';
import 'package:crypto_station/views/auth_screen.dart';
import 'package:crypto_station/views/confirm_code_screen.dart';
import 'package:crypto_station/views/contact_us_screen.dart';
import 'package:crypto_station/views/favourite_screen.dart';
import 'package:crypto_station/views/home_screen.dart';
import 'package:crypto_station/views/notifications_screen.dart';
import 'package:crypto_station/views/offer_details_screen.dart';
import 'package:crypto_station/views/offers_screen.dart';
import 'package:crypto_station/views/privacy_policy_screen.dart';
import 'package:crypto_station/views/search_resault.dart';
import 'package:crypto_station/views/terms_and_conditions_screen.dart';
import 'package:get/get.dart';

class AppPages {

  static const INITIAL = Routes.HOME;

  static final routes = <GetPage<dynamic>>[
     GetPage(name: Routes.LOGIN          , page: () => AuthScreen()                  , binding: AuthBinding()),
     GetPage(name: Routes.HOME           , page: () => HomeScreen()                  , binding: HomeBinding()),
     GetPage(name: Routes.CONTACT        , page: () => ContactUs()                   , binding: HomeBinding()),
     GetPage(name: Routes.ABOUT          , page: () => AboutUs()                     , binding: HomeBinding()),
     GetPage(name: Routes.TERMS          , page: () => TermsAndConditions()          , binding: HomeBinding()),
     GetPage(name: Routes.PRIVACY        , page: () => PrivacyAndPolicy()            , binding: HomeBinding()),
     GetPage(name: Routes.CONFIRM        , page: () => ConfirmCodeScreen()           , binding: HomeBinding()),
     GetPage(name: Routes.NOTIFICATIONS  , page: () => NotificationScreen()    , binding: HomeBinding()),
     GetPage(name: Routes.RESULT_PAGE    , page: () => SearchResultScreen()       , binding: HomeBinding()),
     GetPage(name: Routes.FAVOURITE      , page: () => FavouriteScreen()           , binding: FavouriteBinding()),
     GetPage(name: Routes.OFFERS         , page: () => OffersScreen()             , binding: OffersBinding()),
     GetPage(name: Routes.ADVANCED_SEARCH         , page: () => AdvancedSearchScreen()    , binding: OffersBinding()),
     GetPage(name: Routes.SEARCH_RESULT         , page: () => SearchResultScreen()    , binding: FavouriteBinding()),
     GetPage(name: Routes.OFFER_DETAILS         , page: () => OfferDetailsScreen()    , binding: OffersBinding()),
  ];
}