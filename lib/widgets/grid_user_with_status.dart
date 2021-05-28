import 'package:crypto_station/constants.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class GridUserBlockWithStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context,index) {
        return Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
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
              child:  Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
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
                              image: NetworkImage("https://static01.nyt.com/images/2020/11/20/multimedia/00Gates-1/00Gates-1-mobileMasterAt3x.jpg"),
                            )
                        ),
                      ),

                      SizedBox(width: 10,),

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
                                GestureDetector(
                                  onTap: () {
                                    print('fdfddf');
                                  },
                                  child: Icon(Icons.favorite,color: favouriteColor,),
                                )
                              ],
                            ),

                            SizedBox(height: 5,),

                            // Rating and flag
                            Row(
                              children: [
                                Row(
                                  children: Helper.getStarsList(2.5),),
                                SizedBox(width: 20,),
                                Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/640px-Flag_of_Egypt.svg.png",width: 20,),
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 5,),

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

                  SizedBox(height: 5,),

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
            ),
            Positioned(
              left: 15,
              top: 65,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                decoration: BoxDecoration(
                  color: grayColor,
                  borderRadius: BorderRadius.all(Radius.circular(3.0))
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle,size: 10.0, color: redColor,),
                    SizedBox(width: 3,),
                    CustomText(
                      text: "منتهي",
                      textSize: 13.0,
                      textColor: whiteColor,
                    )
                  ],
                ),
              ),),
          ],
        );
      },
    );
  }
}
