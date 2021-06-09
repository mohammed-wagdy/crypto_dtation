
import 'package:crypto_station/bindings/auth_binding.dart';
import 'package:crypto_station/bindings/favourite_binding.dart';
import 'package:crypto_station/bindings/home_binding.dart';
import 'package:crypto_station/bindings/offers_binding.dart';
import 'package:crypto_station/bindings/profile_binding.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/views/about_us_screen.dart';
import 'package:crypto_station/views/advanced_search_screen.dart';
import 'package:crypto_station/views/all_other_offers.dart';
import 'package:crypto_station/views/all_other_order.dart';
import 'package:crypto_station/views/all_other_requests.dart';
import 'package:crypto_station/views/all_user_offers.dart';
import 'package:crypto_station/views/all_user_orders.dart';
import 'package:crypto_station/views/all_user_requests.dart';
import 'package:crypto_station/views/auth_screen.dart';
import 'package:crypto_station/views/confirm_code_screen.dart';
import 'package:crypto_station/views/contact_us_screen.dart';
import 'package:crypto_station/views/favourite_screen.dart';
import 'package:crypto_station/views/get_all_rates_other_user.dart';
import 'package:crypto_station/views/home_screen.dart';
import 'package:crypto_station/views/notifications_screen.dart';
import 'package:crypto_station/views/offer_details_screen.dart';
import 'package:crypto_station/views/offers_screen.dart';
import 'package:crypto_station/views/other_user.dart';
import 'package:crypto_station/views/privacy_policy_screen.dart';
import 'package:crypto_station/views/search_resault.dart';
import 'package:crypto_station/views/show_offer_from_homepage.dart';
import 'package:crypto_station/views/show_offers_finished.dart';
import 'package:crypto_station/views/show_offers_pending.dart';
import 'package:crypto_station/views/terms_and_conditions_screen.dart';
import 'package:get/get.dart';

class AppPages {

  static const INITIAL_LOGIN = Routes.LOGIN;
  static const INITIAL_HOME = Routes.HOME;

  static final routes = <GetPage<dynamic>>[
     GetPage(name: Routes.LOGIN          , page: () => AuthScreen()                  , binding: AuthBinding()),
     GetPage(name: Routes.HOME           , page: () => HomeScreen()                  , binding: HomeBinding()),
     GetPage(name: Routes.CONTACT        , page: () => ContactUs()                   , binding: HomeBinding()),
     GetPage(name: Routes.ABOUT          , page: () => AboutUs()                     , binding: HomeBinding()),
     GetPage(name: Routes.TERMS          , page: () => TermsAndConditions()          , binding: HomeBinding()),
     GetPage(name: Routes.PRIVACY        , page: () => PrivacyAndPolicy()            , binding: HomeBinding()),
     GetPage(name: Routes.CONFIRM        , page: () => ConfirmCodeScreen()           , binding: AuthBinding()),
     GetPage(name: Routes.NOTIFICATIONS  , page: () => NotificationScreen()    , binding: HomeBinding()),
     GetPage(name: Routes.RESULT_PAGE    , page: () => SearchResultScreen()       , binding: HomeBinding()),
     GetPage(name: Routes.FAVOURITE      , page: () => FavouriteScreen()           , binding: FavouriteBinding()),
     GetPage(name: Routes.OFFERS         , page: () => OffersScreen()             , binding: OffersBinding()),
     GetPage(name: Routes.ADVANCED_SEARCH         , page: () => AdvancedSearchScreen()    , binding: OffersBinding()),
     GetPage(name: Routes.SEARCH_RESULT         , page: () => SearchResultScreen()    , binding: FavouriteBinding()),
     GetPage(name: Routes.OFFER_DETAILS         , page: () => OfferDetailsScreen()    , binding: OffersBinding()),
     GetPage(name: Routes.ALL_USER_OFFERS         , page: () => AllUserOffers()    , binding: ProfileBinding()),
     GetPage(name: Routes.ALL_OTHERS_OFFERS         , page: () => AllOthersOffers()    , binding: AuthBinding()),
     GetPage(name: Routes.ALL_USER_ORDERS         , page: () => AllUserOrders()    , binding: ProfileBinding()),
     GetPage(name: Routes.ALL_OTHERS_ORDERS         , page: () => AllOtherOrders()    , binding: AuthBinding()),
     GetPage(name: Routes.ALL_USER_REQUESTS         , page: () => AllUserRequests()    , binding: ProfileBinding()),
     GetPage(name: Routes.ALL_OTHERS_REQUESTS         , page: () => AllOtherRequests()    , binding: AuthBinding()),
     GetPage(name: Routes.OTHER_USER_PROFILE         , page: () => OtherUserProfileScreen()    , binding: AuthBinding()),
     GetPage(name: Routes.SHOW_OFFERS_FROM_HOMEPAGE         , page: () => ShowOfferFromHomepage()    , binding: OffersBinding()),
     GetPage(name: Routes.SHOW_OFFERS_FROM_HOMEPAGE_FINISHED         , page: () => ShowOfferFromHomepageFinished()    , binding: HomeBinding()),
     GetPage(name: Routes.SHOW_OFFERS_FROM_HOMEPAGE_PENDING         , page: () => ShowOfferFromHomepagePending()    , binding: HomeBinding()),
     GetPage(name: Routes.GET_ALL_RATES_OTHER_USER         , page: () => GetAllRatesOtherUsers()    , binding: ProfileBinding()),
  ];
}