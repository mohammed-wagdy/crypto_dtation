class Offer {
  String? id;
  String? user_id;
  String? payment_type;
  String? type;
  String? quantity;
  String? low_quantity;
  String? pay_price;
  String? country_id;
  String? status;
  String? currency_type;

  Offer();

  Offer.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      user_id = jsonMap['user_id'];
      payment_type = jsonMap['payment_type'];
      type = jsonMap['type'];
      quantity = jsonMap['quantity'];
      low_quantity = jsonMap['low_quantity'];
      pay_price = jsonMap['pay_price'];
      country_id = jsonMap['country_id'];
      status = jsonMap['status'];
      currency_type = jsonMap['currency_type'];
    } catch (e) {
    }
  }



  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map['user_id'] = user_id;
    map['payment_type'] = payment_type;
    map['type'] = type;
    map['quantity'] = quantity;
    map['low_quantity'] = low_quantity;
    map['pay_price'] = pay_price;
    map['country_id'] = country_id;
    map['status'] = status;
    map['currency_type'] = currency_type;
    return map;
  }
}

