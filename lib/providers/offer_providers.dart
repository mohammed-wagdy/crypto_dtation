
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class OffersProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supermsoft.com/public/api/";

  // Add Offer
  Future addOffer({user_id, payment_type, type, pay_price, quantity, low_quantity, country_id}) async {
    var url = Uri.parse("${baseUrl}offer/add");
    var response = await http.post(url , body: {
      "user_id": user_id,
      "payment_type": payment_type,
      "type": type,
      "pay_price": pay_price,
      "quantity": quantity,
      "low_quantity": low_quantity,
      "country_id": country_id,
    },headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Update Offer
  Future updateOffer({user_id, payment_type, type, pay_price, quantity, low_quantity, country_id,offer_id}) async {
    var url = Uri.parse("${baseUrl}offer/update");
    var response = await http.post(url , body: {
      "user_id": user_id,
      "payment_type": payment_type,
      "type": type,
      "pay_price": pay_price,
      "quantity": quantity,
      "low_quantity": low_quantity,
      "country_id": country_id,
      "offer_id": offer_id
    },headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Get Offers With Filter
  Future getOffersWithFilter({search_val,page}) async {
    print("FMFMFFMFMFMF ${search_val}");
    var url = Uri.parse("${baseUrl}get/all/offers?page=$page");
    var response = await http.post(url , body: {
      search_val: search_val,
    },headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }





  // Get All Offers
  Future getAllOffers({page}) async {
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



  Future getMyOffersWithFilter({search_val, user_id,page}) async {
    print("FMFMFFMFMFMF ${search_val}");
    var url = Uri.parse("${baseUrl}get/all/user/offers?page=$page");
    var response = await http.post(url , body: {
      search_val: search_val,
      "user_id": user_id
    },headers: {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${box.read("access_token")}',
    }
    );
    var response_body = json.decode(response.body);
    return response_body;
  }


  // Get My Offers
  Future getMyOffers({user_id,page}) async {
    var url = Uri.parse("${baseUrl}get/all/offers?page=$page");
    var response = await http.post(url , body: {
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


  // advanced search
  Future advancedSearch({name , type , country_id, today_day , quantity,page}) async {
    print("DMFMFMFDMMF name ${name}");
    print("DMFMFMFDMMF type ${type}");
    print("DMFMFMFDMMF country_id ${country_id}");
    print("DMFMFMFDMMF today_day ${today_day}");
    print("DMFMFMFDMMF quantity ${quantity}");
    var url = Uri.parse("${baseUrl}offer/search?page=$page");
    var response = await http.post(url , body: {
      "name": name,
      "type": type,
      "country_id": country_id,
      "today_day": today_day,
      "quantity": quantity,
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