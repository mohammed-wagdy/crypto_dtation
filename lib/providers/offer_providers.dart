
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class OffersProvider {
  GetStorage box = GetStorage();
  final String baseUrl = "http://crypto.supersoftdemo.com/public/api/";

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


}