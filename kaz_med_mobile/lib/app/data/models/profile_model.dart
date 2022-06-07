import 'package:kaz_med/core/network/interfaces/base_network_model.dart';

class ProfileModel extends BaseNetworkModel<ProfileModel> {
  num? customerId;
  String? customerName;
  String? customerSurname;
  String? customerTelNumber;
  String? email;
  String? activationCode;
  String? username;
  String? password;
  String? address;
  bool? status;
  num? rating;
  num? peopleCount;
  List<String>? roles;
  bool? enabled;
  List<String>? authorities;
  bool? accountNonLocked;
  bool? credentialsNonExpired;
  bool? accountNonExpired;

  ProfileModel(
      {this.customerId,
      this.customerName,
      this.customerSurname,
      this.customerTelNumber,
      this.email,
      this.activationCode,
      this.username,
      this.password,
      this.address,
      this.status,
      this.rating,
      this.peopleCount,
      this.roles,
      this.enabled,
      this.authorities,
      this.accountNonLocked,
      this.credentialsNonExpired,
      this.accountNonExpired});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerSurname = json['customerSurname'];
    customerTelNumber = json['customerTelNumber'];
    email = json['email'];
    activationCode = json['activationCode'];
    username = json['username'];
    password = json['password'];
    address = json['address'];
    status = json['status'];
    rating = json['rating'];
    peopleCount = json['peopleCount'];
    roles = json['roles'].cast<String>();
    enabled = json['enabled'];
    authorities = json['authorities'].cast<String>();
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    accountNonExpired = json['accountNonExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['customerSurname'] = customerSurname;
    data['customerTelNumber'] = customerTelNumber;
    data['email'] = email;
    data['activationCode'] = activationCode;
    data['username'] = username;
    data['password'] = password;
    data['address'] = address;
    data['status'] = status;
    data['rating'] = rating;
    data['peopleCount'] = peopleCount;
    data['roles'] = roles;
    data['enabled'] = enabled;
    data['authorities'] = authorities;
    data['accountNonLocked'] = accountNonLocked;
    data['credentialsNonExpired'] = credentialsNonExpired;
    data['accountNonExpired'] = accountNonExpired;
    return data;
  }

  @override
  ProfileModel fromJson(Map<String, dynamic> json) =>
      ProfileModel.fromJson(json);
}
