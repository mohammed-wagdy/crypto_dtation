
import 'dart:convert';

import 'package:crypto_station/models/user.dart';
// import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class NotificationsProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supersoftdemo.com/public/api/";

  // Get All Notifications
  Future getAllNotifications({user_id}) async {
    var url = Uri.parse("${baseUrl}get/notification");
    var response = await http.post(url,
        body: {
      "user_id":user_id
        },
        headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Mark as Seen Notifications
  Future markAsSeenNotification({notification_id}) async {
    var url = Uri.parse("${baseUrl}seen/notification");
    var response = await http.post(url,
        body: {
          "notification_id":notification_id
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("access_token")}',
        });
    var response_body = json.decode(response.body);
    return response_body;
  }


}