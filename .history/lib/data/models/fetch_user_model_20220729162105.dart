class FetchUserResponseModel {
  int? status;
  Data? data;

  FetchUserResponseModel({this.status, this.data});

  FetchUserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserData? userData;
  List<ProductCategories>? productCategories;
  int? totalCarts;
  int? totalOrders;

  Data(
      {this.userData,
      this.productCategories,
      this.totalCarts,
      this.totalOrders});

  Data.fromJson(Map<String, dynamic> json) {
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    if (json['product_categories'] != null) {
      productCategories = <ProductCategories>[];
      json['product_categories'].forEach((v) {
        productCategories!.add(ProductCategories.fromJson(v));
      });
    }
    totalCarts = json['total_carts'];
    totalOrders = json['total_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    if (productCategories != null) {
      data['product_categories'] =
          productCategories!.map((v) => v.toJson()).toList();
    }
    data['total_carts'] = totalCarts;
    data['total_orders'] = totalOrders;
    return data;
  }
}

class UserData {
  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  dynamic profilePic;
  dynamic countryId;
  String? gender;
  String? phoneNo;
  Null? dob;
  bool? isActive;
  String? created;
  String? modified;
  String? accessToken;

  UserData(
      {this.id,
      this.roleId,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.profilePic,
      this.countryId,
      this.gender,
      this.phoneNo,
      this.dob,
      this.isActive,
      this.created,
      this.modified,
      this.accessToken});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    profilePic = json['profile_pic'];
    countryId = json['country_id'];
    gender = json['gender'];
    phoneNo = json['phone_no'];
    dob = json['dob'];
    isActive = json['is_active'];
    created = json['created'];
    modified = json['modified'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['username'] = username;
    data['profile_pic'] = profilePic;
    data['country_id'] = countryId;
    data['gender'] = gender;
    data['phone_no'] = phoneNo;
    data['dob'] = dob;
    data['is_active'] = isActive;
    data['created'] = created;
    data['modified'] = modified;
    data['access_token'] = accessToken;
    return data;
  }
}

class ProductCategories {
  int? id;
  String? name;
  String? iconImage;
  String? created;
  String? modified;

  ProductCategories(
      {this.id, this.name, this.iconImage, this.created, this.modified});

  ProductCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconImage = json['icon_image'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon_image'] = iconImage;
    data['created'] = created;
    data['modified'] = modified;
    return data;
  }
}
