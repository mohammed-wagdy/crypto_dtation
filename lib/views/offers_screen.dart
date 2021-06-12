import 'package:crypto_station/constants.dart';
import 'package:crypto_station/controllers/favourite_controller.dart';
import 'package:crypto_station/controllers/home_controller.dart';
import 'package:crypto_station/controllers/notifications_controller.dart';
import 'package:crypto_station/controllers/offers_controller.dart';
import 'package:crypto_station/helper.dart';
import 'package:crypto_station/routes/app_routes.dart';
import 'package:crypto_station/widgets/custom_button.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:crypto_station/widgets/custom_text_form_field.dart';
import 'package:crypto_station/widgets/grid_user_with_status.dart';
import 'package:crypto_station/widgets/list_user_with_status.dart';
import 'package:crypto_station/widgets/special_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OffersScreen extends GetView<OffersController> {
  FavouriteController favController = Get.put(FavouriteController());


  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    HomeController homecontroller = Get.put(HomeController());
    GetStorage box = GetStorage();
    controller.getMyOffers(user_id: box.read("currentUser")['id'].toString());
    return Obx(() => Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SpecialAppBar(
            drawerContext: context,
            appBarTitle: "العروض",
          )),
      body:



      Column(
        children: [

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                controller.selectMyOffers.value == true ?
                // Filter Drop Down
                PopupMenuButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: nameColor),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_rounded,color: nameColor,size: 12,),
                        CustomText(
                          text: "فلترة البحث",
                          textColor: nameColor,
                          textSize: 13,

                        )
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext bc) => [
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض النشطة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "accepted"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "قيد المراجعة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "pending"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض المنتهية",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "finished"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض المرفوضة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "rejected"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأحدث",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "last"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأقدم",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "first"
                    ),
                  ],
                  onSelected: (val) {
                    controller.getMyOffersWithFilter(search_val: val,user_id: box.read("currentUser")['id'].toString());
                  },
                ) : PopupMenuButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 7,vertical: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: nameColor),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_rounded,color: nameColor,size: 12,),
                        CustomText(
                          text: "فلترة البحث",
                          textColor: nameColor,
                          textSize: 13,

                        )
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext bc) => [
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض النشطة",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "accepted"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "العروض المنتهية",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "finished"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأحدث",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "last"
                    ),
                    PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(Icons.circle,size: 14,color: mainColor,),
                            SizedBox(width: 7,),
                            CustomText(
                              text: "ترتيب بالأقدم",
                              textColor: mainColor,
                              textSize: 13,
                              textFontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        value: "first"
                    ),
                  ],
                  onSelected: (val) {
                    controller.getOffersWithFilter(search_val: val);
                  },
                ),

                SizedBox(width: 3,),
                GestureDetector(
                    onTap: (){
                      controller.isGrid.value = true;
                    },
                    child: Icon(Icons.apps,color: controller.isGrid.value == false ? Colors.grey : nameColor,size: 30,)
                ),
                SizedBox(width: 3,),
                GestureDetector(
                    onTap: (){
                      controller.isGrid.value = false;
                    },
                    child: Icon(Icons.format_list_bulleted_sharp,color: controller.isGrid.value == false ? nameColor : Colors.grey,size: 30,)
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child:  Row(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.selectMyOffers.value = true;
                    controller.getMyOffers(user_id: box.read("currentUser")['id'].toString());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: controller.selectMyOffers.value != false ? nameColor :  grayColor),
                      color: controller.selectMyOffers.value != false ? whiteColor  : Colors.grey.withOpacity(0.2) ,
                    ),
                    child: GestureDetector(
                      child: CustomText(
                        text: "عروضي الخاصة",
                        textFontWeight: FontWeight.bold,
                        textSize: 12,
                        textColor: controller.selectMyOffers.value != false ? nameColor : blackColor,
                      ),
                    ),
                  )
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    controller.selectMyOffers.value = false;
                    controller.getAllOffers();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: controller.selectMyOffers.value == false ? nameColor :  grayColor),
                      color: controller.selectMyOffers.value == false ? whiteColor  : Colors.grey.withOpacity(0.2) ,
                    ),
                    child: CustomText(
                      text: "جميع الصفقات",
                      textSize: 12,
                      textColor: controller.selectMyOffers.value == false ? nameColor : blackColor,
                      textFontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child:

          controller.isLoading.value ?  Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 30,),) :
          controller.filteredOffers.value.isEmpty ?  Center(child: Text("لا يوجد عروض",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),) :

          controller.selectMyOffers.value  == true ?
          SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context,LoadStatus? mode){
                  Widget body ;
                  if(mode==LoadStatus.idle){
                    body =  Text("أسحب للتحميل");
                  }
                  else if(mode==LoadStatus.loading){
                    body =  Text("تحميل المزيد");
                  }
                  else if(mode == LoadStatus.failed){
                    body = Text("Load Failed!Click retry!");
                  }
                  else if(mode == LoadStatus.canLoading){
                    body = Text("release to load more");
                  }
                  else{
                    body = Text("لا يوجد بيانات أخري");
                  }
                  return Container(
                      height: 55.0,
                      child: Center(child: body,)
                  );
                },
              ),
              controller: controller.refreshController,
              onRefresh: controller.onRefreshOffersFilters,
              onLoading: controller.onLoadingAllOffersFilters,
              child:
              controller.isGrid.value == true ?
              GridView.builder(
                itemCount: controller.filteredOffers.value.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 4.2),
                ),
                itemBuilder: (context,index) {
                  DateTime dateTime = DateTime.parse(controller.filteredOffers.value[index]["created_at"],);
                  String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);
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
                                        fit: BoxFit.cover,
                                        image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.filteredOffers.value[index]['user']['image']}"),
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
                                            child: GestureDetector(
                                              onTap: (){
                                                Get.toNamed(Routes.OTHER_USER_PROFILE , arguments: controller.filteredOffers.value[index]["user"]["id"].toString());
                                              },
                                              child: CustomText(
                                                userName: true,
                                                text: controller.filteredOffers.value[index]['user']['full_name'].toString(),
                                                textColor: nameColor,
                                                textSize: 18.0,
                                                textFontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          controller.filteredOffers.value[index]["fav"].isEmpty ?
                                          GestureDetector(
                                            onTap: () {
                                              favController.addToFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
                                            },
                                            child: Icon(Icons.favorite_border_outlined,color: Colors.grey,),
                                          )
                                              :
                                          GestureDetector(
                                            onTap: () {
                                              favController.deleteFromFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
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
                                            children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]['user']['rate'])),),
                                          SizedBox(width: 20,),
                                          Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
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
                                      text: offerDate,
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
                                      text: controller.filteredOffers.value[index]["pay_price"],
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
                                          text: controller.filteredOffers.value[index]["quantity"],
                                          textColor: nameColor,
                                          textSize: 35,
                                          textFontWeight: FontWeight.bold,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                        Container(
                                            color: whiteColor,
                                            padding: EdgeInsets.all(10.0),
                                            child: SingleChildScrollView(
                                              child: Column(
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
                                                              fit:BoxFit.cover,
                                                              image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.filteredOffers.value[index]["user"]["image"]}"),
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
                                                                    text: controller.filteredOffers.value[index]["user"]["full_name"],
                                                                    textColor: nameColor,
                                                                    textSize: 18.0,
                                                                    textFontWeight: FontWeight.bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                            SizedBox(height: 5,),

                                                            // Rating and flag
                                                            Row(
                                                              children: [
                                                                Row(
                                                                  children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]["user"]["rate"])),),
                                                                SizedBox(width: 20,),
                                                                Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                              ],
                                                            )

                                                          ],
                                                        ),
                                                      ),

                                                      Container(
                                                        padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                                                        decoration: BoxDecoration(
                                                            color: grayColor,
                                                            borderRadius: BorderRadius.all(Radius.circular(3.0))
                                                        ),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                                Icons.circle,size: 10.0,
                                                                color:
                                                                controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                                                                controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                                                                controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                                                                controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                            ),
                                                            SizedBox(width: 3,),
                                                            CustomText(
                                                              text:
                                                              controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                                                              controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                                              controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                                                              controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : "",
                                                              textSize: 13.0,
                                                              textColor: whiteColor,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex:1,
                                                        child: CustomText(
                                                          text: "رقم العرض",
                                                          textColor: Colors.grey,
                                                          textFontWeight: FontWeight.bold,
                                                          textSize: 14.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: CustomText(
                                                          text: controller.filteredOffers.value[index]["id"].toString(),
                                                          textColor: nameColor,
                                                          textFontWeight: FontWeight.w500,
                                                          textSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex:1,
                                                        child: CustomText(
                                                          text: "حالة العرض",
                                                          textColor: Colors.grey,
                                                          textFontWeight: FontWeight.bold,
                                                          textSize: 14.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: CustomText(
                                                          text: controller.filteredOffers.value[index]["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
                                                          textColor: nameColor,
                                                          textFontWeight: FontWeight.w500,
                                                          textSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex:1,
                                                        child: CustomText(
                                                          text: "نوع العملة",
                                                          textColor: Colors.grey,
                                                          textFontWeight: FontWeight.bold,
                                                          textSize: 14.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: CustomText(
                                                          text: controller.filteredOffers.value[index]["currency_type"].toString(),
                                                          textColor: nameColor,
                                                          textFontWeight: FontWeight.w500,
                                                          textSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: CustomText(
                                                          text: "طريقة الدفع",
                                                          textColor: Colors.grey,
                                                          textFontWeight: FontWeight.bold,
                                                          textSize: 14.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: CustomText(
                                                          text: controller.filteredOffers.value[index]["payment_type"].toString(),
                                                          textColor: nameColor,
                                                          textFontWeight: FontWeight.w500,
                                                          textSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex:1,
                                                        child: CustomText(
                                                          text: "البلد",
                                                          textColor: Colors.grey,
                                                          textFontWeight: FontWeight.bold,
                                                          textSize: 14.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex:2,
                                                        child: Row(
                                                          children: [
                                                            Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                            SizedBox(width: 10,),
                                                            CustomText(
                                                              text: "مصر",
                                                              textColor: nameColor,
                                                              textFontWeight: FontWeight.w500,
                                                              textSize: 14.0,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex:1,
                                                        child: CustomText(
                                                          text: "عمولة الوساطة",
                                                          textColor: Colors.grey,
                                                          textFontWeight: FontWeight.bold,
                                                          textSize: 14.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: CustomText(
                                                          text: "علي المشتري (${controller.filteredOffers.value[index]["percent"].toString()})",
                                                          textColor: nameColor,
                                                          textFontWeight: FontWeight.w500,
                                                          textSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: CustomTextFormField(
                                                            textLabel: "الكمية",
                                                            isInitialValue: true,
                                                            initVal: controller.filteredOffers.value[index]["quantity"].toString(),
                                                            // textController: payType,
                                                            keyboardType: TextInputType.number
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Expanded(
                                                        child: CustomTextFormField(
                                                            isInitialValue: true,
                                                            initVal: controller.filteredOffers.value[index]["low_quantity"].toString(),
                                                            textLabel: "أقل كمية",
                                                            // textController: payType,
                                                            keyboardType: TextInputType.number
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      Expanded(
                                                        child: CustomTextFormField(
                                                            textLabel: "سعر الصرف",
                                                            isInitialValue: true,
                                                            initVal: controller.filteredOffers.value[index]["pay_price"].toString(),
                                                            //  textController: payType,
                                                            keyboardType: TextInputType.number
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: CustomText(
                                                          text: " تاريخ العرض",
                                                          textColor: Colors.grey,
                                                          textFontWeight: FontWeight.bold,
                                                          textSize: 14.0,
                                                        ),
                                                        flex: 1,
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: CustomText(
                                                          text: offerDate,
                                                          textColor: nameColor,
                                                          textFontWeight: FontWeight.w500,
                                                          textSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),

                                                  Obx(() =>homecontroller.isLoading.value ?
                                                  Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 250,),) :
                                                  // When Click On مشاهدة العرض
                                                  Container(
                                                    width: double.infinity,
                                                    child:
                                                    controller.filteredOffers.value[index]["user"]["id"] != box.read("currentUser")['id'] ?
                                                    CustomButton(
                                                      buttonText: "طلب العرض",
                                                      buttonOnPress: () {

                                                        // Order Offer
                                                        homecontroller.orderOffer(user_id: box.read("currentUser")['id'].toString(),offer_id: controller.filteredOffers.value[index]["id"].toString());


                                                      },
                                                    ) : SizedBox(),
                                                  ))

                                                ],
                                              ),
                                            )
                                        )
                                    );
                                  },
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
                              Icon(
                                Icons.circle,
                                size: 10.0,
                                color:
                                controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                                controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                                controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                                controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                ,
                              ),
                              SizedBox(width: 3,),
                              CustomText(
                                text:
                                controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                                controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                                controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : ""
                                ,
                                textSize: 13.0,
                                textColor: whiteColor,
                              )
                            ],
                          ),
                        ),),
                    ],
                  );
                },
              ) :
              ListView.builder(
                  itemCount: controller.filteredOffers.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime dateTime = DateTime.parse(controller.filteredOffers.value[index]["created_at"],);
                    String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);
                    return Stack(
                      children: [
                        Container(
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
                                              fit: BoxFit.cover,
                                              image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.filteredOffers.value[index]['user']['image']}"),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  Get.toNamed(Routes.OTHER_USER_PROFILE , arguments: controller.filteredOffers.value[index]["user"]["id"].toString());
                                                },
                                                child: CustomText(
                                                  text: controller.filteredOffers.value[index]['user']['full_name'].toString(),
                                                  textColor: nameColor,
                                                  textSize: 16.0,
                                                  textFontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                              SizedBox(width: 20,),
                                              controller.filteredOffers.value[index]["fav"].isEmpty ?
                                              GestureDetector(
                                                onTap: () {
                                                  favController.addToFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
                                                },
                                                child: Icon(Icons.favorite_border_outlined,color: Colors.grey,),
                                              )
                                                  :
                                              GestureDetector(
                                                onTap: () {
                                                  favController.deleteFromFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
                                                },
                                                child: Icon(Icons.favorite,color: favouriteColor,),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]['user']['rate'])),),
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
                                        text: offerDate,
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
                                        text: controller.filteredOffers.value[index]["pay_price"],
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
                                            text: controller.filteredOffers.value[index]["quantity"],
                                            textColor: nameColor,
                                            textSize: 35,
                                            textFontWeight: FontWeight.bold,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(
                                          Container(
                                              color: whiteColor,
                                              padding: EdgeInsets.all(10.0),
                                              child: SingleChildScrollView(
                                                child: Column(
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
                                                                fit:BoxFit.cover,
                                                                image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.filteredOffers.value[index]["user"]["image"]}"),
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
                                                                      text: controller.filteredOffers.value[index]["user"]["full_name"],
                                                                      textColor: nameColor,
                                                                      textSize: 18.0,
                                                                      textFontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              SizedBox(height: 5,),

                                                              // Rating and flag
                                                              Row(
                                                                children: [
                                                                  Row(
                                                                    children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]["user"]["rate"])),),
                                                                  SizedBox(width: 20,),
                                                                  Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                                ],
                                                              )

                                                            ],
                                                          ),
                                                        ),

                                                        Container(
                                                          padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                                                          decoration: BoxDecoration(
                                                              color: grayColor,
                                                              borderRadius: BorderRadius.all(Radius.circular(3.0))
                                                          ),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              Icon(
                                                                  Icons.circle,size: 10.0,
                                                                  color:
                                                                  controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                                                                  controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                                                                  controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                                                                  controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                              ),
                                                              SizedBox(width: 3,),
                                                              CustomText(
                                                                text:
                                                                controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                                                                controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                                                controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                                                                controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : "",
                                                                textSize: 13.0,
                                                                textColor: whiteColor,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "رقم العرض",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["id"].toString(),
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "حالة العرض",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "نوع العملة",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["currency_type"].toString(),
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: CustomText(
                                                            text: "طريقة الدفع",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["payment_type"].toString(),
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "البلد",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex:2,
                                                          child: Row(
                                                            children: [
                                                              Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                              SizedBox(width: 10,),
                                                              CustomText(
                                                                text: "مصر",
                                                                textColor: nameColor,
                                                                textFontWeight: FontWeight.w500,
                                                                textSize: 14.0,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "عمولة الوساطة",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: "علي المشتري (${controller.filteredOffers.value[index]["percent"].toString()})",
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: CustomTextFormField(
                                                              textLabel: "الكمية",
                                                              isInitialValue: true,
                                                              initVal: controller.filteredOffers.value[index]["quantity"].toString(),
                                                              // textController: payType,
                                                              keyboardType: TextInputType.number
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Expanded(
                                                          child: CustomTextFormField(
                                                              isInitialValue: true,
                                                              initVal: controller.filteredOffers.value[index]["low_quantity"].toString(),
                                                              textLabel: "أقل كمية",
                                                              // textController: payType,
                                                              keyboardType: TextInputType.number
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Expanded(
                                                          child: CustomTextFormField(
                                                              textLabel: "سعر الصرف",
                                                              isInitialValue: true,
                                                              initVal: controller.filteredOffers.value[index]["pay_price"].toString(),
                                                              //  textController: payType,
                                                              keyboardType: TextInputType.number
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: CustomText(
                                                            text: " تاريخ العرض",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                          flex: 1,
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: offerDate,
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Obx(() =>homecontroller.isLoading.value ?
                                                    Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 250,),) :
                                                    // When Click On مشاهدة العرض
                                                    Container(
                                                      width: double.infinity,
                                                      child:
                                                      controller.filteredOffers.value[index]["user"]["id"] != box.read("currentUser")['id'] ?
                                                      CustomButton(
                                                        buttonText: "طلب العرض",
                                                        buttonOnPress: () {

                                                          // Order Offer
                                                          homecontroller.orderOffer(user_id: box.read("currentUser")['id'].toString(),offer_id: controller.filteredOffers.value[index]["id"].toString());


                                                        },
                                                      ) : SizedBox(),
                                                    ))

                                                  ],
                                                ),
                                              )
                                          )
                                      );
                                    },
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
                          top: 55,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                            decoration: BoxDecoration(
                                color: grayColor,
                                borderRadius: BorderRadius.all(Radius.circular(3.0))
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                  color:
                                  controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                                  controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                                  controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                                  controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                  ,
                                ),
                                SizedBox(width: 3,),
                                CustomText(
                                  text:
                                  controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                                  controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                  controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                                  controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : ""
                                  ,
                                  textSize: 13.0,
                                  textColor: whiteColor,
                                )
                              ],
                            ),
                          ),),
                      ],
                    );
                  })
          ) :
          SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context,LoadStatus? mode){
                  Widget body ;
                  if(mode==LoadStatus.idle){
                    body =  Text("أسحب للتحميل");
                  }
                  else if(mode==LoadStatus.loading){
                    body =  Text("تحميل المزيد");
                  }
                  else if(mode == LoadStatus.failed){
                    body = Text("Load Failed!Click retry!");
                  }
                  else if(mode == LoadStatus.canLoading){
                    body = Text("release to load more");
                  }
                  else{
                    body = Text("لا يوجد بيانات أخري");
                  }
                  return Container(
                      height: 55.0,
                      child: Center(child: body,)
                  );
                },
              ),
              controller: controller.refreshController,
              onRefresh: controller.onRefreshOffersFiltersAll,
              onLoading: controller.onLoadingAllOffersFiltersAll,
              child:
          controller.isGrid.value == true ?
          GridView.builder(
            itemCount: controller.filteredOffers.value.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4.2),
            ),
            itemBuilder: (context,index) {
              DateTime dateTime = DateTime.parse(controller.filteredOffers.value[index]["created_at"],);
              String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);
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
                                    fit: BoxFit.cover,
                                    image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.filteredOffers.value[index]['user']['image']}")
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
                                        child: GestureDetector(
                                          onTap: (){
                                            Get.toNamed(Routes.OTHER_USER_PROFILE , arguments: controller.filteredOffers.value[index]["user"]["id"].toString());
                                          },
                                          child: CustomText(
                                            userName: true,
                                            text: controller.filteredOffers.value[index]['user']['full_name'].toString(),
                                            textColor: nameColor,
                                            textSize: 18.0,
                                            textFontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      controller.filteredOffers.value[index]["fav"].isEmpty ?
                                      GestureDetector(
                                        onTap: () {
                                          favController.addToFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
                                        },
                                        child: Icon(Icons.favorite_border_outlined,color: Colors.grey,),
                                      )
                                          :
                                      GestureDetector(
                                        onTap: () {
                                          favController.deleteFromFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
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
                                        children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]['user']['rate'])),),
                                      SizedBox(width: 20,),
                                      Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
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
                                  text: offerDate,
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
                                  text: controller.filteredOffers.value[index]["pay_price"],
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
                                      text: controller.filteredOffers.value[index]["quantity"],
                                      textColor: nameColor,
                                      textSize: 35,
                                      textFontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                    Container(
                                        color: whiteColor,
                                        padding: EdgeInsets.all(10.0),
                                        child: SingleChildScrollView(
                                          child: Column(
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
                                                          fit:BoxFit.cover,
                                                          image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.filteredOffers.value[index]["user"]["image"]}"),
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
                                                                text: controller.filteredOffers.value[index]["user"]["full_name"],
                                                                textColor: nameColor,
                                                                textSize: 18.0,
                                                                textFontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        SizedBox(height: 5,),

                                                        // Rating and flag
                                                        Row(
                                                          children: [
                                                            Row(
                                                              children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]["user"]["rate"])),),
                                                            SizedBox(width: 20,),
                                                            Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                          ],
                                                        )

                                                      ],
                                                    ),
                                                  ),

                                                  Container(
                                                    padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                                                    decoration: BoxDecoration(
                                                        color: grayColor,
                                                        borderRadius: BorderRadius.all(Radius.circular(3.0))
                                                    ),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                            Icons.circle,size: 10.0,
                                                            color:
                                                            controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                                                            controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                                                            controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                                                            controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                        ),
                                                        SizedBox(width: 3,),
                                                        CustomText(
                                                          text:
                                                          controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                                                          controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                                          controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                                                          controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : "",
                                                          textSize: 13.0,
                                                          textColor: whiteColor,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex:1,
                                                    child: CustomText(
                                                      text: "رقم العرض",
                                                      textColor: Colors.grey,
                                                      textFontWeight: FontWeight.bold,
                                                      textSize: 14.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CustomText(
                                                      text: controller.filteredOffers.value[index]["id"].toString(),
                                                      textColor: nameColor,
                                                      textFontWeight: FontWeight.w500,
                                                      textSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex:1,
                                                    child: CustomText(
                                                      text: "حالة العرض",
                                                      textColor: Colors.grey,
                                                      textFontWeight: FontWeight.bold,
                                                      textSize: 14.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CustomText(
                                                      text: controller.filteredOffers.value[index]["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
                                                      textColor: nameColor,
                                                      textFontWeight: FontWeight.w500,
                                                      textSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex:1,
                                                    child: CustomText(
                                                      text: "نوع العملة",
                                                      textColor: Colors.grey,
                                                      textFontWeight: FontWeight.bold,
                                                      textSize: 14.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CustomText(
                                                      text: controller.filteredOffers.value[index]["currency_type"].toString(),
                                                      textColor: nameColor,
                                                      textFontWeight: FontWeight.w500,
                                                      textSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: CustomText(
                                                      text: "طريقة الدفع",
                                                      textColor: Colors.grey,
                                                      textFontWeight: FontWeight.bold,
                                                      textSize: 14.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CustomText(
                                                      text: controller.filteredOffers.value[index]["payment_type"].toString(),
                                                      textColor: nameColor,
                                                      textFontWeight: FontWeight.w500,
                                                      textSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex:1,
                                                    child: CustomText(
                                                      text: "البلد",
                                                      textColor: Colors.grey,
                                                      textFontWeight: FontWeight.bold,
                                                      textSize: 14.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex:2,
                                                    child: Row(
                                                      children: [
                                                        Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                        SizedBox(width: 10,),
                                                        CustomText(
                                                          text: "مصر",
                                                          textColor: nameColor,
                                                          textFontWeight: FontWeight.w500,
                                                          textSize: 14.0,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    flex:1,
                                                    child: CustomText(
                                                      text: "عمولة الوساطة",
                                                      textColor: Colors.grey,
                                                      textFontWeight: FontWeight.bold,
                                                      textSize: 14.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CustomText(
                                                      text: "علي المشتري (${controller.filteredOffers.value[index]["percent"].toString()})",
                                                      textColor: nameColor,
                                                      textFontWeight: FontWeight.w500,
                                                      textSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: CustomTextFormField(
                                                        textLabel: "الكمية",
                                                        isInitialValue: true,
                                                        initVal: controller.filteredOffers.value[index]["quantity"].toString(),
                                                        // textController: payType,
                                                        keyboardType: TextInputType.number
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Expanded(
                                                    child: CustomTextFormField(
                                                        isInitialValue: true,
                                                        initVal: controller.filteredOffers.value[index]["low_quantity"].toString(),
                                                        textLabel: "أقل كمية",
                                                        // textController: payType,
                                                        keyboardType: TextInputType.number
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Expanded(
                                                    child: CustomTextFormField(
                                                        textLabel: "سعر الصرف",
                                                        isInitialValue: true,
                                                        initVal: controller.filteredOffers.value[index]["pay_price"].toString(),
                                                        //  textController: payType,
                                                        keyboardType: TextInputType.number
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: CustomText(
                                                      text: " تاريخ العرض",
                                                      textColor: Colors.grey,
                                                      textFontWeight: FontWeight.bold,
                                                      textSize: 14.0,
                                                    ),
                                                    flex: 1,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: CustomText(
                                                      text: offerDate,
                                                      textColor: nameColor,
                                                      textFontWeight: FontWeight.w500,
                                                      textSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                              ),

                                              SizedBox(height: 10,),

                                              Obx(() =>homecontroller.isLoading.value ?
                                              Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 250,),) :
                                              // When Click On مشاهدة العرض
                                              Container(
                                                width: double.infinity,
                                                child:
                                                controller.filteredOffers.value[index]["user"]["id"] != box.read("currentUser")['id'] ?
                                                CustomButton(
                                                  buttonText: "طلب العرض",
                                                  buttonOnPress: () {

                                                    // Order Offer
                                                    homecontroller.orderOffer(user_id: box.read("currentUser")['id'].toString(),offer_id: controller.filteredOffers.value[index]["id"].toString());


                                                  },
                                                ) : SizedBox(),
                                              ))

                                            ],
                                          ),
                                        )
                                    )
                                );
                              },
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
                          Icon(
                            Icons.circle,
                            size: 10.0,
                            color:
                            controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                            controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                            controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                            controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                            ,
                          ),
                          SizedBox(width: 3,),
                          CustomText(
                            text:
                            controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                            controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                            controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                            controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : ""
                            ,
                            textSize: 13.0,
                            textColor: whiteColor,
                          )
                        ],
                      ),
                    ),),
                ],
              );
            },
          ) :
          ListView.builder(
                  itemCount: controller.filteredOffers.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime dateTime = DateTime.parse(controller.filteredOffers.value[index]["created_at"],);
                    String offerDate =  DateFormat('yyyy-MM-dd').format(dateTime);
                    return Stack(
                      children: [
                        Container(
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
                                              fit: BoxFit.cover,
                                              image: NetworkImage(controller.filteredOffers.value[index]['user']['image']),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  Get.toNamed(Routes.OTHER_USER_PROFILE , arguments: controller.filteredOffers.value[index]["user"]["id"].toString());
                                                },
                                                child: CustomText(
                                                  text: controller.filteredOffers.value[index]['user']['full_name'].toString(),
                                                  textColor: nameColor,
                                                  textSize: 16.0,
                                                  textFontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                              SizedBox(width: 20,),
                                              controller.filteredOffers.value[index]["fav"].isEmpty ?
                                              GestureDetector(
                                                onTap: () {
                                                  favController.addToFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
                                                },
                                                child: Icon(Icons.favorite_border_outlined,color: Colors.grey,),
                                              )
                                                  :
                                              GestureDetector(
                                                onTap: () {
                                                  favController.deleteFromFavourite(offer_id: controller.filteredOffers.value[index]['id'].toString());
                                                },
                                                child: Icon(Icons.favorite,color: favouriteColor,),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]['user']['rate'])),),
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
                                        text: offerDate,
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
                                        text: controller.filteredOffers.value[index]["pay_price"],
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
                                            text: controller.filteredOffers.value[index]["quantity"],
                                            textColor: nameColor,
                                            textSize: 35,
                                            textFontWeight: FontWeight.bold,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(
                                          Container(
                                              color: whiteColor,
                                              padding: EdgeInsets.all(10.0),
                                              child: SingleChildScrollView(
                                                child: Column(
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
                                                                fit:BoxFit.cover,
                                                                image: NetworkImage("http://crypto.supersoftdemo.com/public/image/user/${controller.filteredOffers.value[index]["user"]["image"]}",),
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
                                                                      text: controller.filteredOffers.value[index]["user"]["full_name"],
                                                                      textColor: nameColor,
                                                                      textSize: 18.0,
                                                                      textFontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),

                                                              SizedBox(height: 5,),

                                                              // Rating and flag
                                                              Row(
                                                                children: [
                                                                  Row(
                                                                    children: Helper.getStarsList(double.parse(controller.filteredOffers.value[index]["user"]["rate"])),),
                                                                  SizedBox(width: 20,),
                                                                  Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                                ],
                                                              )

                                                            ],
                                                          ),
                                                        ),

                                                        Container(
                                                          padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                                                          decoration: BoxDecoration(
                                                              color: grayColor,
                                                              borderRadius: BorderRadius.all(Radius.circular(3.0))
                                                          ),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              Icon(
                                                                  Icons.circle,size: 10.0,
                                                                  color:
                                                                  controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                                                                  controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                                                                  controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                                                                  controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                                              ),
                                                              SizedBox(width: 3,),
                                                              CustomText(
                                                                text:
                                                                controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                                                                controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                                                controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                                                                controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : "",
                                                                textSize: 13.0,
                                                                textColor: whiteColor,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "رقم العرض",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["id"].toString(),
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "حالة العرض",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["type"].toString() == "sale" ? "مطلوب للبيع " : "مطلوب للشراء",
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "نوع العملة",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["currency_type"].toString(),
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: CustomText(
                                                            text: "طريقة الدفع",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: controller.filteredOffers.value[index]["payment_type"].toString(),
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "البلد",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex:2,
                                                          child: Row(
                                                            children: [
                                                              Image.network("http://crypto.supersoftdemo.com/public/image/country/${controller.filteredOffers[index]["country"]['image']}",width: 20,),
                                                              SizedBox(width: 10,),
                                                              CustomText(
                                                                text: "مصر",
                                                                textColor: nameColor,
                                                                textFontWeight: FontWeight.w500,
                                                                textSize: 14.0,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          flex:1,
                                                          child: CustomText(
                                                            text: "عمولة الوساطة",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: "علي المشتري (${controller.filteredOffers.value[index]["percent"].toString()})",
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: CustomTextFormField(
                                                              textLabel: "الكمية",
                                                              isInitialValue: true,
                                                              initVal: controller.filteredOffers.value[index]["quantity"].toString(),
                                                              // textController: payType,
                                                              keyboardType: TextInputType.number
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Expanded(
                                                          child: CustomTextFormField(
                                                              isInitialValue: true,
                                                              initVal: controller.filteredOffers.value[index]["low_quantity"].toString(),
                                                              textLabel: "أقل كمية",
                                                              // textController: payType,
                                                              keyboardType: TextInputType.number
                                                          ),
                                                        ),
                                                        SizedBox(width: 10,),
                                                        Expanded(
                                                          child: CustomTextFormField(
                                                              textLabel: "سعر الصرف",
                                                              isInitialValue: true,
                                                              initVal: controller.filteredOffers.value[index]["pay_price"].toString(),
                                                              //  textController: payType,
                                                              keyboardType: TextInputType.number
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: CustomText(
                                                            text: " تاريخ العرض",
                                                            textColor: Colors.grey,
                                                            textFontWeight: FontWeight.bold,
                                                            textSize: 14.0,
                                                          ),
                                                          flex: 1,
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: CustomText(
                                                            text: offerDate,
                                                            textColor: nameColor,
                                                            textFontWeight: FontWeight.w500,
                                                            textSize: 14.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),

                                                    SizedBox(height: 10,),

                                                    Obx(() =>homecontroller.isLoading.value ?
                                                    Center(child: Image.asset("assets/images/ajaxLoader.gif",width: 250,),) :
                                                    // When Click On مشاهدة العرض
                                                    Container(
                                                      width: double.infinity,
                                                      child:
                                                      controller.filteredOffers.value[index]["user"]["id"] != box.read("currentUser")['id'] ?
                                                      CustomButton(
                                                        buttonText: "طلب العرض",
                                                        buttonOnPress: () {

                                                          // Order Offer
                                                          homecontroller.orderOffer(user_id: box.read("currentUser")['id'].toString(),offer_id: controller.filteredOffers.value[index]["id"].toString());


                                                        },
                                                      ) : SizedBox(),
                                                    ))

                                                  ],
                                                ),
                                              )
                                          )
                                      );
                                    },
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
                          top: 55,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
                            decoration: BoxDecoration(
                                color: grayColor,
                                borderRadius: BorderRadius.all(Radius.circular(3.0))
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 10.0,
                                  color:
                                  controller.filteredOffers.value[index]["status"].toString() == "pending" ? Colors.orange :
                                  controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? redColor :
                                  controller.filteredOffers.value[index]["status"].toString() == "finished" ? redColor :
                                  controller.filteredOffers.value[index]["status"].toString() == "accepted" ? greenColor : Colors.orange
                                  ,
                                ),
                                SizedBox(width: 3,),
                                CustomText(
                                  text:
                                  controller.filteredOffers.value[index]["status"].toString() == "pending" ? "معلق" :
                                  controller.filteredOffers.value[index]["status"].toString() == "rejected"  ? "مرفوض" :
                                  controller.filteredOffers.value[index]["status"].toString() == "finished" ? "منتهي" :
                                  controller.filteredOffers.value[index]["status"].toString() == "accepted" ? "نشط" : ""
                                  ,
                                  textSize: 13.0,
                                  textColor: whiteColor,
                                )
                              ],
                            ),
                          ),),
                      ],
                    );
                  })
          )

          )
        ],
      ),
    ));
  }
}
