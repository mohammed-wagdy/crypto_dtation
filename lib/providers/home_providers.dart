
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supersoftdemo.com/public/api/";

  // Get All Offers In Homepage
  Future getHomePageAllOffers({page}) async {
    var url = Uri.parse("${baseUrl}get/all/offers?page=$page");
    var response = await http.post(url,headers: {
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



  // Get finished offers Homepage
  Future getFinishedOffers({page}) async {
    var url = Uri.parse("${baseUrl}get/all/offers?page=$page");
    var response = await http.post(url,
        body: {
            "finished": "finished"
        },
        headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }



  // Get pending offers Homepage
  Future getPendingOffers({page}) async {
    var url = Uri.parse("${baseUrl}get/all/offers?page=$page");
    var response = await http.post(url,
        body: {
          "pending": "pending"
        },
        headers: {
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("access_token")}',
        }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }




  // Get special offers Homepage
  Future getspecialdOffers({page}) async {
    var url = Uri.parse("${baseUrl}get/all/offers?page=$page");
    var response = await http.post(url,
        body: {
          "user_id": box.read("currentUser")['id'].toString()
        },
        headers: {
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read("access_token")}',
        }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }


  //




}