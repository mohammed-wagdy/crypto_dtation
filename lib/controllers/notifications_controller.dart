import 'package:crypto_station/helper.dart';
import 'package:crypto_station/providers/notifications_providers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationsController extends GetxController {

  GetStorage box = GetStorage();
  RxList notiList = [].obs;
  RxList unreadNotiList = [].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAllNotifications();
   await getCountNotifications();
  }


  // Get All Notifications
  Future getAllNotifications() async {
    isLoading.value = true;
   await NotificationsProvider().getAllNotifications(user_id: box.read("currentUser")['id'].toString(),page: 1).then((value) {
     print("F<FFF<F<FF< ${value["notifi"]['data'].length}");
      notiList.value = value["notifi"]['data'];
     print("F<FFF<F<FF< ${value["notifi"]['data']}");
    });
    isLoading.value = false;
  }

  // Mark as Seen Notification
  Future markAsSeenNotification({notification_id}) async {
    isLoading.value = true;
    await NotificationsProvider().markAsSeenNotification(notification_id: notification_id).then((value) {
      print("FMFMFMFMMSMSMDSDMSDM ${value}");
      getAllNotifications();
      getCountNotifications();
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
      }
    });
    isLoading.value = false;
  }

  // Get Count Of Un Seen Notifications
  getCountNotifications() async {
    if(notiList.length > 0) {
      for(var prop in notiList){
        if(prop['seen'] == "0") {
          unreadNotiList.value.add(prop);
        }
      }
    }
  }

}
