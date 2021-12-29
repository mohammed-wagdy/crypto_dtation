
import 'dart:convert';

import 'package:crypto_station/models/user.dart';
// import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GeneralProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supermsoft.com/public/api/";

  // Privacy
  Future getPrivacy() async {
    var url = Uri.parse("${baseUrl}get/privacy");
    var response = await http.get(url,headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Contact Us
  Future contactUs({message , subject , email , phone}) async {
    var url = Uri.parse("${baseUrl}set/contactus");
    var response = await http.post(url,body: {
      "message":message,
      "subject":subject,
      "email":email,
      "phone":phone,
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }

  // About
  Future getAboutUs() async {
    var url = Uri.parse("${baseUrl}get/about");
    var response = await http.get(url,headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Terms And Conditions
  Future getTermsAndConditions() async {
    var url = Uri.parse("${baseUrl}get/license");
    var response = await http.get(url,headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }

}