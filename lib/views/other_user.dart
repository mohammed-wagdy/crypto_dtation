import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/auth_controller.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/profile_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OtherUserProfileScreen extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());
  AuthController authController = Get.put(AuthController());
  var user_offer_id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print("FMFWEWEWIEWIWIEWIE ${user_offer_id}");
    authController.getUserProfile(user_id: user_offer_id);
    controller.getRates(user_id: user_offer_id);
    // authController.getOffersCount(user_id: Get.arguments);
    // authController.getOrdersCount(user_id: Get.arguments);
    // authController.getOrdersRequestsCount(user_id: Get.arguments);

    return Obx(() => Scaffold(
      //key: controller.scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomDarkAppBar(
            noBackground: true,
            appBarTitle: 'بروفايل المستخدم',
            drawerContext: context,
          )),
      backgroundColor: whiteColor,
      body:
      authController.isLoading.value ?
      Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 30,),)
          :
      ListView(
        //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            // User Data
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      // color: Theme.of(context).focusColor.withOpacity(0.2),
                      offset: Offset(0, 0),
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 7,
                    )
                  ]),
              child: Column(
                children: [

                  // User Data
                  Row(
                    children: [


                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${authController.otherUserProfile['image']}"),
                            )
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name and Favourite
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: CustomText(
                                    userName: true,
                                    text: authController.otherUserProfile['full_name'],
                                    textColor: nameColor,
                                    textSize: 18.0,
                                    textFontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 5,
                            ),

                            // Rating and flag
                            Row(
                              children: [
                                Row(
                                  children: Helper.getStarsList(double.parse(authController.otherUserProfile['rate'])),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Image.network(
                                  "${authController.otherUserProfile['country']['image']}",
                                  width: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  // Email
                  ProfileDetailsWidget(
                      label: "البريد الألكتروني",
                      data: authController.otherUserProfile['email'],
                      iconImage: "assets/images/emailIcon.png"),
                  SizedBox(height: 15),

                  // Phone
                  ProfileDetailsWidget(
                      label: "رقم الجوال",
                      data: authController.otherUserProfile['phone'],
                      iconImage: "assets/images/Phone Icon.png"),
                  SizedBox(height: 15),

                  // Wallet Address
                  ProfileDetailsWidget(
                      label: "عنوان المحفظة",
                      data: authController.otherUserProfile['wallet_address'],
                      iconImage: "assets/images/walletIcon.png"),
                  SizedBox(height: 15),

                  // Network Kind
                  ProfileDetailsWidget(
                      label: "نوع الشبكة",
                      data: authController.otherUserProfile['network_type'],
                      iconImage: "assets/images/typeIcon.png"),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         padding: EdgeInsets.all(10.0),
                  //         decoration: BoxDecoration(
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(100.0)),
                  //           color: nameColor,
                  //         ),
                  //         child: CustomText(
                  //           text: "الض",
                  //           textSize: 15,
                  //           textColor: whiteColor,
                  //           textFontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),

            // Statistics
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                      EdgeInsets.only(bottom: 0,left: 10,right: 10,top: 10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0XFF157e9c),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/listIcon.PNG",
                            width: 30,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: "عروض",
                            textFontWeight: FontWeight.w500,
                            textColor: whiteColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: authController.offerCount.value.toString(),
                            textFontWeight: FontWeight.bold,
                            textColor: whiteColor,
                            textSize: 35,
                          ),

                          Container(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: (){
                                  Get.toNamed(Routes.ALL_OTHERS_OFFERS, arguments: Get.arguments);
                                },
                                icon: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: whiteColor,
                                    size: 18,
                                  ),
                                )
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                      EdgeInsets.only(bottom: 0,left: 10,right: 10,top: 10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0XFF157e9c),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/listIcon.PNG",
                            width: 30,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: "صفقات",
                            textFontWeight: FontWeight.w500,
                            textColor: whiteColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: authController.orderCount.value.toString(),
                            textFontWeight: FontWeight.bold,
                            textColor: whiteColor,
                            textSize: 35,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: (){
                                  Get.toNamed(Routes.ALL_OTHERS_ORDERS, arguments: Get.arguments);
                                },
                                icon: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: whiteColor,
                                    size: 18,
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                      EdgeInsets.only(bottom: 0,left: 10,right: 10,top: 10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0XFF157e9c),
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/listIcon.PNG",
                            width: 30,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: "طلبات",
                            textFontWeight: FontWeight.w500,
                            textColor: whiteColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: authController.orderRequestCount.value.toString(),
                            textFontWeight: FontWeight.bold,
                            textColor: whiteColor,
                            textSize: 35,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: (){
                                  Get.toNamed(Routes.ALL_OTHERS_REQUESTS,arguments: Get.arguments);
                                },
                                icon: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: whiteColor,
                                    size: 18,
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Rating
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: CustomText(
                text: "التقييمات",
                textColor: nameColor,
                textFontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Write Comment Rate
            controller.user.value.id != Get.arguments ?
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.grey.withOpacity(0.3))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 20.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          FontAwesomeIcons.solidStar,
                          color: rateColor,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                          authController.rateCount.value = rating;
                        },
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // User Data
                  Row(
                    children: [
                      // User Image
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  "${controller.user.value.image}"),
                            )),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name and Favourite
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: CustomText(
                                    userName: true,
                                    text: controller.user.value.fullName.toString(),
                                    textColor: nameColor,
                                    textSize: 16.0,
                                    textFontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 5,
                            ),

                            // Rating and flag
                            Row(
                              children: [
                                Row(
                                  children: Helper.getStarsList(double.parse(controller.user.value.rate.toString())),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Image.network(
                                  controller.user.value.country!['image'],
                                  width: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  CustomTextFormField(
                      textLabel: "أكتب تعليقك",
                      textController: authController.messageController,
                      isTextArea: true,
                      keyboardType: TextInputType.text),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          buttonBackground: whiteColor,
                          buttonText: "إضافة",
                          buttonTextColor: nameColor,
                          buttonTextSize: 15.0,
                          buttonOnPress: () {
                              authController.setRate(user_id: user_offer_id,user_offer_id: controller.user.value.id.toString(),);
                          }),
                    ],
                  )
                ],
              ),
            ) : SizedBox(),

            SizedBox(
              height: 10,
            ),

            controller.rates.value.isEmpty ? Center(child: Text("لا يوجد تقييمات"),) :
            Column(
              children: [
                ListView.separated(
                  separatorBuilder: (BuildContext ctn, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 10.0,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  //    primary: false,
                  //   physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.rates.take(2).length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(color: Colors.grey.withOpacity(0.3))),
                      child: Column(
                        children: [
                          // User Data
                          Row(
                            children: [
                              // User Image
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(color: grayColor),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "${controller.rates[index]['user']['image']}"),
                                    )),
                              ),

                              SizedBox(
                                width: 10,
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name and Favourite
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: CustomText(
                                            userName: true,
                                            text: controller.rates[index]['user']['full_name'],
                                            textColor: nameColor,
                                            textSize: 16.0,
                                            textFontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    // Rating and flag
                                    Row(
                                      children: [
                                        Row(
                                          children: Helper.getStarsList(double.parse(controller.rates[index]['user']['rate'])),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Image.network(
                                          "${controller.rates[index]['user']['country']['image']}",
                                          width: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            child: CustomText(
                              text:
                              controller.rates[index]['message'],
                              textColor: Colors.grey,
                              textSize: 13.0,
                              textFontWeight: FontWeight.w500,
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        buttonBackground: whiteColor,
                        buttonText: "جميع التعليقات",
                        buttonTextColor: nameColor,
                        buttonTextSize: 15.0,
                        buttonOnPress: () {
                          Get.toNamed(Routes.GET_ALL_RATES_OTHER_USER,arguments : user_offer_id);
                        }),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),
          ]),
    ));
  }
}
