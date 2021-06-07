
import 'dart:convert';

import 'package:crypto_station/models/user.dart';
// import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class FavouriteProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supersoftdemo.com/public/api/";

  // Get Favourite List
  Future getFavouriteList({user_id}) async {
    var url = Uri.parse("${baseUrl}get/fav");
    var response = await http.post(url,body: {
      "user_id": user_id
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Add To Favourite List
  Future addToFavourite({user_id, offer_id}) async {
    var url = Uri.parse("${baseUrl}set/fav");
    var response = await http.post(url,body: {
      "user_id": user_id,
      "offer_id": offer_id,
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Delete Favourite List
  Future deleteFromFavourite({offer_id}) async {
    var url = Uri.parse("${baseUrl}delete/fav");
    var response = await http.post(url,body: {
      "offer_id": offer_id,
    },headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    });
    var response_body = json.decode(response.body);
    return response_body;
  }

}