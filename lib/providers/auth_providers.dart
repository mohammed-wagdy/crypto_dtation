
import 'dart:convert';

import 'package:crypto_station/models/user.dart';
// import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

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
  Future updateUserData({password, phone,wallet_address,user_id, country_id,full_name,image_url}) async {
    print("dfffffffF");
    print("dfffffffF ${box.read("currentUser")['image'].split('/').last}");
    print("dfffffffF ${image_url?.path}");
    String fileName = image_url?.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile?.fromFile(image_url?.path, filename:fileName),
      "password": password,
      "user_id": user_id,
      "phone": phone,
      "wallet_address": wallet_address,
      "country_id": country_id,
      "full_name": full_name
    });
    var dio = Dio();
    final response = await dio.post("http://crypto.supersoftdemo.com/public/api/update/profile",data: formData,
      options: Options(
          headers: {
            // 'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read("access_token")}',
          }
      ));
    return response.data;
  }


  // Get All Countries
  Future getAllCountries() async {
    var url = Uri.parse("${baseUrl}get/country");
    var response = await http.get(url);
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Get Offers Count
  Future getOffersCount({user_id}) async {
    var url = Uri.parse("${baseUrl}get/profile/user/offers");
    var response = await http.post(url,body: {
      "user_id": user_id
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Get Orders Count
  Future getOrdersCount({user_id}) async {
    var url = Uri.parse("${baseUrl}get/profile/user/orders");
    var response = await http.post(url,body: {
      "user_id": user_id
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Get Orders Requests Count
  Future getOrdersRequestsCount({user_id}) async {
    var url = Uri.parse("${baseUrl}get/profile/user/request/orders");
    var response = await http.post(url,body: {
      "user_id": user_id
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Get Rates
  Future getRates({user_id}) async {
    print("VMDFMDM ${user_id}");
    var url = Uri.parse("${baseUrl}get/rate");
    print("VMDFMDM ${url}");
    var response = await http.post(url,body: {
      "user_id": user_id
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }



  // Delete Offer
  Future deleteOffer({offer_id}) async  {
    var url = Uri.parse("${baseUrl}offer/delete");
    var response = await http.post(url,body: {
      "offer_id": offer_id
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }



  // Get User Profile
  Future getUserProfile({user_id}) async {
    var url = Uri.parse("${baseUrl}get/profile");
    var response = await http.post(url,body: {
      "user_id": user_id
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Set Rate
  Future setRate({user_id, user_offer_id, rate, message}) async {
    var url = Uri.parse("${baseUrl}set/rate");
    var response = await http.post(url,body: {
      "user_id": user_id,
      "user_offer_id": user_offer_id,
      "rate": rate,
      "message": message,
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }
}