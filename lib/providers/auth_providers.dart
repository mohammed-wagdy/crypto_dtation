
import 'dart:convert';

import 'package:crypto_station/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supersoftdemo.com/public/api/";

  // Login
  Future login({email, password}) async {
    var url = Uri.parse("${baseUrl}login");
    var response = await http.post(url , body: {
      "email": email,
      "password": password
    });
    var response_body = json.decode(response.body);
    print("FDOFDO 444444 ${response_body}");
    return response_body;
  }


  // Register
  Future register({full_name , email , password , wallet_address , country_id , phone}) async {
    var url = Uri.parse("${baseUrl}register");
    var response =  await http.post(url,body: {
      "full_name": full_name,
      "email": email,
      "password": password,
      "wallet_address": wallet_address,
      "country_id": country_id,
      "phone": phone
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Verify Account
  Future verifyAccount({user_id, verify_code}) async {
    var url = Uri.parse("${baseUrl}verify/account");
    var response = await http.post(url , body: {
      "user_id": user_id,
      "verify_code": verify_code
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Reset Password
  Future resetPassword({email}) async {
    var url = Uri.parse("${baseUrl}password/email");
    var response = await http.post(url , body: {
      "email": email,
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Update User Information
  Future updateUserData({password, phone,wallet_address,user_id}) async {
    var url = Uri.parse("${baseUrl}update/profile");
    var response = await http.post(url , body: {
      "password": password,
      "user_id": user_id,
      "phone": phone,
      "wallet_address": wallet_address
    },headers: {
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Get All Countries
  Future getAllCountries() async {
    var url = Uri.parse("${baseUrl}get/country");
    var response = await http.get(url);
    var response_body = json.decode(response.body);
    return response_body;
  }

}