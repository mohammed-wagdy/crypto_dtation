class User {
  String? id;
  int? rolesName;
  String? fullName;
  String? email;
  String? walletAddress;
  String? countryId;
  String? networkType;
  String? verifyCode;
  String? status;
  String? image;
  String? phone;
  String? rate;
  Map? country;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap) {
    print("FODFODFDO ${jsonMap}");
    try {
      id = jsonMap['id'].toString();
      rolesName = jsonMap['roles_name'];
      fullName = jsonMap['full_name'];
      email = jsonMap['email'];
      status = jsonMap['status'];
      countryId = jsonMap['country_id'];
      networkType = jsonMap['network_type'];
      verifyCode = jsonMap['verify_code'];
      walletAddress = jsonMap['wallet_address'];
      image = jsonMap['image'];
      phone = jsonMap['phone'];
      rate = jsonMap['rate'];
      country = jsonMap['country'];
    } catch (e) {
    }
  }



  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map['roles_name'] = rolesName;
    map['full_name'] = fullName;
    map['email'] = email;
    map['status'] = status;
    map['country_id'] = countryId;
    map['network_type'] = networkType;
    map['verify_code'] = verifyCode;
    map['wallet_address'] = walletAddress;
    map['image'] = image;
    map['phone'] = phone;
    map['rate'] = rate;
    map['country'] = country;
    return map;
  }
}

