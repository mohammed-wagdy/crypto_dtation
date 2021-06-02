
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supersoftdemo.com/public/api/";

  // Get All Offers In Homepage
  Future getHomePageAllOffers() async {
    var url = Uri.parse("${baseUrl}get/all/offers");
    var response = await http.post(url,body: {
    //  "accepted": "accepted"
    },headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }



  // Order Offer
  Future orderOffer({offer_id,user_id}) async {
    var url = Uri.parse("${baseUrl}offer/order");
    var response = await http.post(url,body: {
        "offer_id": offer_id,
        "user_id": user_id,
    },headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }


}