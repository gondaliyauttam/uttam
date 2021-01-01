import 'dart:convert';

Loginmodel loginmodelFromJson(String str) =>
    Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  Loginmodel({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.token,
    this.message,
  });

  User user;
  String token;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"] == null ? null : json["token"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "token": token == null ? null : token,
        "message": token == null ? null : message,
      };
}

class User {
  User({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.categoryId,
    this.profileImage,
    this.roleId,
    this.currencyCode,
    this.hourlyRate,
    this.heading,
    this.description,
    this.firstname,
    this.lastname,
    this.birthday,
    this.companyName,
    this.cvr,
    this.cpr,
    this.address,
    this.countryCode,
    this.zipCode,
    this.town,
    this.mobileNumber,
    this.homePage,
    this.availableWeekends,
    this.available,
    this.paypalId,
    this.latitude,
    this.longitude,
    this.loginType,
    this.mobileVerified,
    this.firebaseId,
    this.oneSignalId,
    this.pushToken,
    this.appleId,
    this.name,
    this.canPostJob,
    this.profileImageUrl,
    this.isCompany,
    this.role,
    this.categories,
    this.country,
    this.currency,
  });

  int id;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic username;
  dynamic categoryId;
  String profileImage;
  int roleId;
  String currencyCode;
  int hourlyRate;
  String heading;
  String description;
  String firstname;
  String lastname;
  DateTime birthday;
  String companyName;
  String cvr;
  dynamic cpr;
  String address;
  String countryCode;
  String zipCode;
  String town;
  String mobileNumber;
  String homePage;
  dynamic availableWeekends;
  int available;
  dynamic paypalId;
  String latitude;
  String longitude;
  int loginType;
  bool mobileVerified;
  String firebaseId;
  String oneSignalId;
  dynamic pushToken;
  dynamic appleId;
  String name;
  bool canPostJob;
  String profileImageUrl;
  bool isCompany;
  Role role;
  List<Category> categories;
  Country country;
  Currency currency;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        username: json["username"],
        categoryId: json["category_id"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
        hourlyRate: json["hourly_rate"] == null ? null : json["hourly_rate"],
        heading: json["heading"] == null ? null : json["heading"],
        description: json["description"] == null ? null : json["description"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        companyName: json["company_name"] == null ? null : json["company_name"],
        cvr: json["cvr"] == null ? null : json["cvr"],
        cpr: json["cpr"],
        address: json["address"] == null ? null : json["address"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        zipCode: json["zip_code"] == null ? null : json["zip_code"],
        town: json["town"] == null ? null : json["town"],
        mobileNumber:
            json["mobile_number"] == null ? null : json["mobile_number"],
        homePage: json["home_page"] == null ? null : json["home_page"],
        availableWeekends: json["available_weekends"],
        available: json["available"] == null ? null : json["available"],
        paypalId: json["paypal_id"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        loginType: json["login_type"] == null ? null : json["login_type"],
        mobileVerified:
            json["mobile_verified"] == null ? null : json["mobile_verified"],
        firebaseId: json["firebase_id"] == null ? null : json["firebase_id"],
        oneSignalId:
            json["one_signal_id"] == null ? null : json["one_signal_id"],
        pushToken: json["push_token"],
        appleId: json["apple_id"],
        name: json["name"] == null ? null : json["name"],
        canPostJob: json["can_post_job"] == null ? null : json["can_post_job"],
        profileImageUrl: json["profile_image_url"] == null
            ? null
            : json["profile_image_url"],
        isCompany: json["is_company"] == null ? null : json["is_company"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "username": username,
        "category_id": categoryId,
        "profile_image": profileImage == null ? null : profileImage,
        "role_id": roleId == null ? null : roleId,
        "currency_code": currencyCode == null ? null : currencyCode,
        "hourly_rate": hourlyRate == null ? null : hourlyRate,
        "heading": heading == null ? null : heading,
        "description": description == null ? null : description,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "birthday": birthday == null
            ? null
            : "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "company_name": companyName == null ? null : companyName,
        "cvr": cvr == null ? null : cvr,
        "cpr": cpr,
        "address": address == null ? null : address,
        "country_code": countryCode == null ? null : countryCode,
        "zip_code": zipCode == null ? null : zipCode,
        "town": town == null ? null : town,
        "mobile_number": mobileNumber == null ? null : mobileNumber,
        "home_page": homePage == null ? null : homePage,
        "available_weekends": availableWeekends,
        "available": available == null ? null : available,
        "paypal_id": paypalId,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "login_type": loginType == null ? null : loginType,
        "mobile_verified": mobileVerified == null ? null : mobileVerified,
        "firebase_id": firebaseId == null ? null : firebaseId,
        "one_signal_id": oneSignalId == null ? null : oneSignalId,
        "push_token": pushToken,
        "apple_id": appleId,
        "name": name == null ? null : name,
        "can_post_job": canPostJob == null ? null : canPostJob,
        "profile_image_url": profileImageUrl == null ? null : profileImageUrl,
        "is_company": isCompany == null ? null : isCompany,
        "role": role == null ? null : role.toJson(),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "country": country == null ? null : country.toJson(),
        "currency": currency == null ? null : currency.toJson(),
      };
}

class LoginUser {
  String email;
  String password;

  LoginUser({this.email, this.password});
  // Map<String, dynamic> toJson() => {
  //       "email": email == null ? null : email,
  //       "password": password == null ? null : password,
  //     };
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}

class Category {
  Category({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.nameDk,
    this.parentId,
    this.pivot,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String nameDk;
  int parentId;
  Pivot pivot;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        name: json["name"] == null ? null : json["name"],
        nameDk: json["name_dk"] == null ? null : json["name_dk"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "name": name == null ? null : name,
        "name_dk": nameDk == null ? null : nameDk,
        "parent_id": parentId == null ? null : parentId,
        "pivot": pivot == null ? null : pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    this.userId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  int userId;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"] == null ? null : json["user_id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "category_id": categoryId == null ? null : categoryId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Country {
  Country({
    this.id,
    this.code,
    this.name,
  });

  int id;
  String code;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "name": name == null ? null : name,
      };
}

class Currency {
  Currency({
    this.id,
    this.code,
    this.name,
    this.symbol,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String code;
  String name;
  String symbol;
  DateTime createdAt;
  DateTime updatedAt;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "name": name == null ? null : name,
        "symbol": symbol == null ? null : symbol,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Role {
  Role({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.name,
    this.canPostJob,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String title;
  String name;
  bool canPostJob;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        title: json["title"] == null ? null : json["title"],
        name: json["name"] == null ? null : json["name"],
        canPostJob: json["can_post_job"] == null ? null : json["can_post_job"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "title": title == null ? null : title,
        "name": name == null ? null : name,
        "can_post_job": canPostJob == null ? null : canPostJob,
      };
}
