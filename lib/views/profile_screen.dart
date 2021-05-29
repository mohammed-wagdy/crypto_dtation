import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/widgets/custom_appbar.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/profile_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());
  List myArr = ['1','2','3','4','5','6'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: controller.scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBar(
            drawerContext: context,
          )),
      backgroundColor: whiteColor,
      body: ListView(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Search
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: controller.searchInput,
                keyboardType: TextInputType.text,
                cursorColor: mainColor,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.grey,
                  ),
                  hintText: "البحث ...",
                  hintStyle: TextStyle(color: Colors.grey),
                  // fillColor: inputFillColor,
                  contentPadding: EdgeInsets.all(15.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: inputBorderColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: inputBorderColor),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ),

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
                  // Edit Button
                  Container(
                      alignment: Alignment.topLeft,
                      child: TextButton.icon(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              //  minimumSize: Size(50, 30),
                              alignment: Alignment.topLeft),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Row(
                                            children: [
                                              TextButton.icon(
                                                  style: TextButton.styleFrom(
                                                      padding: EdgeInsets.zero,
                                                      //  minimumSize: Size(50, 30),
                                                      alignment:
                                                          Alignment.topLeft),
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.done,
                                                    size: 14,
                                                    color: mainColor,
                                                  ),
                                                  label: CustomText(
                                                    text: "حفظ",
                                                    textSize: 14,
                                                    textColor: mainColor,
                                                    textFontWeight:
                                                        FontWeight.w500,
                                                  ))
                                            ],
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                          ),
                                          Row(
                                            children: [
                                              // User Image
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: grayColor),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
                                                    )),
                                              ),

                                              SizedBox(
                                                width: 10,
                                              ),

                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Name and Favourite
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Expanded(
                                                          child: CustomText(
                                                            userName: true,
                                                            text:
                                                                " محمد وجدي محمد ",
                                                            textColor:
                                                                nameColor,
                                                            textSize: 15.0,
                                                            textFontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    Divider(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                    ),

                                                    // Rating and flag
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        bc) {
                                                                  return SafeArea(
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          new Wrap(
                                                                        children: <
                                                                            Widget>[
                                                                          new ListTile(
                                                                              leading: new Icon(
                                                                                Icons.photo_library,
                                                                                color: mainColor,
                                                                              ),
                                                                              title: new Text('أختيار الصورة من الأستوديو'),
                                                                              onTap: () {
                                                                                controller.imgFromGallery();
                                                                                Navigator.of(context).pop();
                                                                              }),
                                                                          new ListTile(
                                                                            leading:
                                                                                new Icon(
                                                                              Icons.photo_camera,
                                                                              color: mainColor,
                                                                            ),
                                                                            title:
                                                                                new Text('ألتقاط صورة'),
                                                                            onTap:
                                                                                () {
                                                                              controller.imgFromCamera();
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 1,
                                                                    horizontal:
                                                                        4),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              color: grayColor,
                                                            ),
                                                            child: CustomText(
                                                              text:
                                                                  "تغيير الصورة",
                                                              textSize: 12,
                                                              textColor:
                                                                  mainColor,
                                                              textFontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 40,
                                                        ),
                                                        Image.network(
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",
                                                          width: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          CustomTextFormField(
                                              textLabel: "البريد الألكتروني",
                                              textLabelSize: 14.0,
                                              textController:
                                                  controller.searchInput,
                                              keyboardType:
                                                  TextInputType.emailAddress),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextFormField(
                                            textLabel: "كلمة المرور",
                                            textLabelSize: 14.0,
                                            textController:
                                                controller.searchInput,
                                            keyboardType: TextInputType.text,
                                            isSecure: true,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextFormField(
                                              textLabel: "رقم الجوال",
                                              textLabelSize: 14.0,
                                              textController:
                                                  controller.searchInput,
                                              keyboardType:
                                                  TextInputType.number),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomTextFormField(
                                              textLabel: "عنوان المحفظة",
                                              textLabelSize: 14.0,
                                              textController:
                                                  controller.searchInput,
                                              keyboardType: TextInputType.text),
                                        ],
                                      ),
                                    ),
                                  );
                                });

                          },
                          icon: Icon(
                            FontAwesomeIcons.user,
                            size: 14,
                            color: mainColor,
                          ),
                          label: CustomText(
                            text: "تعديل",
                            textSize: 14,
                            textColor: mainColor,
                            textFontWeight: FontWeight.w500,
                          ))),

                  // User Data
                  Row(
                    children: [
                      // User Image
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
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
                                    text: " محمد وجدي محمد ",
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
                                  children: Helper.getStarsList(2.5),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",
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
                      data: "mohamed.wagdy957@gmail.com",
                      iconImage: "assets/images/emailIcon.png"),
                  SizedBox(height: 15),

                  // Phone
                  ProfileDetailsWidget(
                      label: "رقم الجوال",
                      data: "01009848788",
                      iconImage: "assets/images/Phone Icon.png"),
                  SizedBox(height: 15),

                  // Wallet Address
                  ProfileDetailsWidget(
                      label: "عنوان المحفظة",
                      data: "trc20 شبكة",
                      iconImage: "assets/images/walletIcon.png"),
                  SizedBox(height: 15),

                  // Network Kind
                  ProfileDetailsWidget(
                      label: "نوع الشبكة",
                      data: "trc20 ",
                      iconImage: "assets/images/typeIcon.png"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100.0)),
                            color: nameColor,
                          ),
                          child: CustomText(
                            text: "العروض",
                            textSize: 15,
                            textColor: whiteColor,
                            textFontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5,),
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
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            text: "53",
                            textFontWeight: FontWeight.bold,
                            textColor: whiteColor,
                            textSize: 40,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: whiteColor,
                                  size: 12,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            text: "53",
                            textFontWeight: FontWeight.bold,
                            textColor: whiteColor,
                            textSize: 40,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: whiteColor,
                                  size: 12,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                            text: "53",
                            textFontWeight: FontWeight.bold,
                            textColor: whiteColor,
                            textSize: 40,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: whiteColor,
                                  size: 12,
                                )),
                          ),
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
                        itemBuilder: (context, _) =>
                            Icon(FontAwesomeIcons.solidStar,color: rateColor,
                            ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),

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
                                  "https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
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
                                    text: " محمد وجدي محمد ",
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
                                  children: Helper.getStarsList(2.5),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",
                                  width: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),


                  CustomTextFormField(
                      textLabel: "أكتب تعليقك",
                      textController: controller.searchInput,
                      isTextArea: true,
                      keyboardType: TextInputType.text
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        buttonBackground: whiteColor,
                          buttonText: "إضافة",
                          buttonTextColor: nameColor,
                          buttonTextSize: 15.0,
                          buttonOnPress: () {}
                          ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

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
              itemCount: myArr.take(2).length,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border:
                      Border.all(color: Colors.grey.withOpacity(0.3))),
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
                                      "https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
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
                                        text: " محمد وجدي محمد ",
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
                                      children: Helper.getStarsList(2.5),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Image.network(
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",
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
                      CustomText(
                        text:
                        "تم إضافة العرض الخاص بك وهو الأن قيد المراجعة من قبل الإدارة وسيتم إرسال بريد ألكتروني عند الموافقة علي العرض او يمكنك متابعة التطبيق",
                        textColor: Colors.grey,
                        textSize: 13.0,
                        textFontWeight: FontWeight.w500,
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
                    buttonOnPress: () {}
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
          ]),
    );
  }
}
