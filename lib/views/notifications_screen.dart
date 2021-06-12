import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/notifications_controller.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_dark_appbar.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends GetView<NotificationsController> {


  @override
  Widget build(BuildContext context) {

    NotificationsController controller = Get.put(NotificationsController());
    controller.getAllNotifications();
    controller.getCountNotifications();


    return Obx(()=>Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomDarkAppBar(
              appBarTitle: "التنبيهات",
              drawerContext: context,
            )),
        body:

        controller.isLoading.value ? Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 30,)) :

        controller.notiList.length == 0 ? Center(child:

        Center(child: Text("لا يوجد تنبيهات",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),) ,) :

        ListView.builder(
          itemCount: controller.notiList.length,
          itemBuilder: (BuildContext context , int index) {
            DateTime dateTime = DateTime.parse(controller.notiList[index]['created_at'],);
            String offerDate =  DateFormat('yyyy-MM-dd hh:mm').format(dateTime);
            print("DMDMDDMDMDMDSDSDSDS ${controller.notiList[index]['user_get_notifi']['image']}");
            return Container(
                padding: EdgeInsets.all(10.0),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: grayColor),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.notiList[index]['user_get_notifi']['image']}"),
                              )
                          ),
                        ),

                        SizedBox(width: 10,),

                        Expanded(
                          child: CustomText(
                            text: "${controller.notiList[index]['message']}",
                            textColor: Colors.grey,
                            textSize: 13.0,
                            textFontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Divider(
                      color: grayColor,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/dateIcon.png',width: 15,),
                            SizedBox(width: 5,),
                            CustomText(
                              text: offerDate,
                              textSize: 12,
                              textColor: grayColor,
                            )
                          ],
                        ),

                        controller.notiList[index]['seen'] == "0" ?

                        GestureDetector(
                          onTap: (){
                            controller.markAsSeenNotification(notification_id:controller.notiList[index]['id'].toString());
                          },
                          child: Row(
                            children: [
                              Icon(Icons.done,size: 13,),
                              SizedBox(width: 2,),
                              CustomText(
                                textSize: 12,
                                textColor: mainColor,
                                text: "تعليم كمقروء",
                              )
                            ],
                          ),
                        )

                            :

                        GestureDetector(
                          onTap: (){},
                          child: Row(
                            children: [
                              Icon(Icons.done,size: 13,color: Colors.grey,),
                              SizedBox(width: 2,),
                              CustomText(
                                textSize: 12,
                                textColor: Colors.grey,
                                text: "تمت القراءة",
                              )
                            ],
                          ),
                        )
                      ],
                    )

                  ],
                )
            );
          },
        )
    ));
  }
}
