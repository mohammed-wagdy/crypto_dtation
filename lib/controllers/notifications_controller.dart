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
    getAllNotifications();
    getCountNotifications();
  }


  // Get All Notifications
  Future getAllNotifications() async {
    isLoading.value = true;
   await NotificationsProvider().getAllNotifications(user_id: box.read("currentUser")['id'].toString()).then((value) {
      notiList.value = value["notifi"];
    });
    isLoading.value = false;
  }

  // Mark as Seen Notification
  Future markAsSeenNotification({notification_id}) async {
    isLoading.value = true;
    await NotificationsProvider().markAsSeenNotification(notification_id: notification_id).then((value) {
      if(value['status'] == 1) {
        Helper.successSnackBar("جيد", value['message']);
      }
    });
    isLoading.value = false;
  }

  // Get Count Of Un Seen Notifications
  getCountNotifications() {

    if(notiList.length > 0) {
      for(var prop in notiList){
        if(prop['seen'] == "0") {
          unreadNotiList.value.add(prop);
        }
      }
    }
  }

}
