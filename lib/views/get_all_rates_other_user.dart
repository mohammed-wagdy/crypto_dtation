import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/profile_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAllRatesOtherUsers extends GetView<ProfileController> {

  var user_offer_id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getRates(user_id: user_offer_id);
    return Scaffold(
      //key: controller.scaffoldKey,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomDarkAppBar(
              noBackground: true,
              appBarTitle: 'جميع التعليقات',
              drawerContext: context,
            )),
        backgroundColor: whiteColor,
        body:

        controller.rates.isEmpty ?
        Center(child: Text("لا يوجد تعليقات",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),)
            :
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
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
              itemCount: controller.rates.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Column(
                  children: [
                    Container(
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
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 10,),
          ],
        ),
      )
    );
  }
}
