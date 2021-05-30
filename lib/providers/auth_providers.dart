
import 'dart:convert';

import 'package:crypto_station/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthProvider {

  final String baseUrl = "http://crypto.supersoftdemo.com/public/api/";

  // Login
  Future login({email, password}) async {
    var url = Uri.parse("${baseUrl}login");
    var response = await http.post(url , body: {
      "email": email,
      "password": password
    });
    var response_body = json.decode(response.body);
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

}