import 'user_model.dart';

class ProfileModel {
  int? id;
  String? cusName;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  String? cusPostcode;
  String? cusCountry;
  String? cusPhone;
  String? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  String? shipState;
  String? shipPostcode;
  String? shipCountry;
  String? shipPhone;
  int? userId;
  String? createdAt;
  String? updatedAt;
  UserModel? user;

  ProfileModel(
      {this.id,
        this.cusName,
        this.cusAdd,
        this.cusCity,
        this.cusState,
        this.cusPostcode,
        this.cusCountry,
        this.cusPhone,
        this.cusFax,
        this.shipName,
        this.shipAdd,
        this.shipCity,
        this.shipState,
        this.shipPostcode,
        this.shipCountry,
        this.shipPhone,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.user});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id']; // storing the id from the json data into id
    cusName = json['cus_name'];
    cusAdd = json['cus_add'];
    cusCity = json['cus_city'];
    cusState = json['cus_state'];
    cusPostcode = json['cus_postcode'];
    cusCountry = json['cus_country'];
    cusPhone = json['cus_phone'];
    cusFax = json['cus_fax'];
    shipName = json['ship_name'];
    shipAdd = json['ship_add'];
    shipCity = json['ship_city'];
    shipState = json['ship_state'];
    shipPostcode = json['ship_postcode'];
    shipCountry = json['ship_country'];
    shipPhone = json['ship_phone'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cus_name'] = cusName;
    data['cus_add'] = cusAdd;
    data['cus_city'] = cusCity;
    data['cus_state'] = cusState;
    data['cus_postcode'] = cusPostcode;
    data['cus_country'] = cusCountry;
    data['cus_phone'] = cusPhone;
    data['cus_fax'] = cusFax;
    data['ship_name'] = shipName;
    data['ship_add'] = shipAdd;
    data['ship_city'] = shipCity;
    data['ship_state'] = shipState;
    data['ship_postcode'] = shipPostcode;
    data['ship_country'] = shipCountry;
    data['ship_phone'] = shipPhone;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}



// the data below is extracted from the latest api 👇

// class ProfileModel {
//   String? sId;
//   String? firstName;
//   String? lastName;
//   String? email;
//   bool? emailVerified;
//   String? phone;
//   bool? phoneVerified;
//   String? avatarUrl;
//   String? city;
//   int? role;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   ProfileModel(
//       {this.sId,
//         this.firstName,
//         this.lastName,
//         this.email,
//         this.emailVerified,
//         this.phone,
//         this.phoneVerified,
//         this.avatarUrl,
//         this.city,
//         this.role,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   ProfileModel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     emailVerified = json['email_verified'];
//     phone = json['phone'];
//     phoneVerified = json['phone_verified'];
//     avatarUrl = json['avatar_url'];
//     city = json['city'];
//     role = json['role'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email'] = this.email;
//     data['email_verified'] = this.emailVerified;
//     data['phone'] = this.phone;
//     data['phone_verified'] = this.phoneVerified;
//     data['avatar_url'] = this.avatarUrl;
//     data['city'] = this.city;
//     data['role'] = this.role;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
