// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.userId,
    this.userType,
    this.fullName,
    this.username,
    this.email,
    this.countryCode,
    this.contactNumber,
    this.countryCodeName,
    this.isNotification,
    this.pinset,
    this.createdDate,
    this.image,
    this.userDeviceId,
    this.fcmToken,
    this.token,
  });

  int userId;
  String userType;
  String fullName;
  String username;
  String email;
  String countryCode;
  String contactNumber;
  String countryCodeName;
  String isNotification;
  String pinset;
  DateTime createdDate;
  String image;
  String userDeviceId;
  String fcmToken;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"] == null ? null : json["user_id"],
        userType: json["user_type"] == null ? null : json["user_type"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        contactNumber:
            json["contact_number"] == null ? null : json["contact_number"],
        countryCodeName: json["country_code_name"] == null
            ? null
            : json["country_code_name"],
        isNotification:
            json["is_notification"] == null ? null : json["is_notification"],
        pinset: json["pinset"] == null ? null : json["pinset"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        image: json["image"] == null ? null : json["image"],
        userDeviceId:
            json["user_device_id"] == null ? null : json["user_device_id"],
        fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "user_type": userType == null ? null : userType,
        "full_name": fullName == null ? null : fullName,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "country_code": countryCode == null ? null : countryCode,
        "contact_number": contactNumber == null ? null : contactNumber,
        "country_code_name": countryCodeName == null ? null : countryCodeName,
        "is_notification": isNotification == null ? null : isNotification,
        "pinset": pinset == null ? null : pinset,
        "created_date":
            createdDate == null ? null : createdDate.toIso8601String(),
        "image": image == null ? null : image,
        "user_device_id": userDeviceId == null ? null : userDeviceId,
        "fcm_token": fcmToken == null ? null : fcmToken,
        "token": token == null ? null : token,
      };
}
