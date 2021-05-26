import 'package:crypto_station/constants.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ListUserBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
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
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        // User Image
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(100),
                          decoration: BoxDecoration(
                              border: Border.all(color: grayColor),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage("https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
                              )
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: "محمد وجدي محمد كمال",
                                  textColor: nameColor,
                                  textSize: 16.0,
                                  textFontWeight: FontWeight.bold,
                                ),
                                SizedBox(width: 10,),
                                Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                                SizedBox(width: 20,),
                                GestureDetector(
                                  onTap: () {
                                    print('fdfddf');
                                  },
                                  child: Icon(Icons.favorite,color: favouriteColor,),
                                )
                              ],
                            ),
                            Row(
                              children: Helper.getStarsList(2.5),),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [

                    // Date
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/dateIcon.png',width: 15,),
                        SizedBox(width: 5,),
                        CustomText(
                          text: "5 مايو 2021",
                          textSize: 17,
                          textColor: grayColor,
                        )
                      ],
                    ),

                    SizedBox(width: 30,),

                    // Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/priceIcon.png",width: 15,),
                        SizedBox(width: 5,),
                        CustomText(
                          text: "سعر الصرف:",
                          textSize: 17,
                          textColor: grayColor,
                        ),
                        SizedBox(width: 5,),
                        CustomText(
                          text: "15.16",
                          textColor: nameColor,
                          textFontWeight: FontWeight.w600,
                          textSize: 18,
                        ),
                      ],
                    )
                  ],
                ),
                //SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/quantityIcon.png",width: 20,),
                        SizedBox(width: 5,),
                        CustomText(
                          text: "الكمية",
                          textColor: grayColor,
                          textSize: 17,
                        ),
                        SizedBox(width: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            CustomText(
                              text: "USDT",
                              textColor: grayColor,
                              textSize: 14,
                            ),
                            SizedBox(width: 3,),
                            CustomText(
                              text: "95843",
                              textColor: nameColor,
                              textSize: 35,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: CustomText(
                        text: "المزيد",
                        textColor: nameColor,
                        textFontWeight: FontWeight.bold,
                        textSize: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
