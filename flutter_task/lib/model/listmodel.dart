// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

import 'dart:convert';

ListModel listModelFromJson(String str) => ListModel.fromJson(json.decode(str));

String listModelToJson(ListModel data) => json.encode(data.toJson());

class ListModel {
  ListModel({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
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
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        nextPageUrl:
            json["next_page_url"] == null ? null : json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "next_page_url": nextPageUrl == null ? null : nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class Datum {
  Datum({
    this.id,
    this.latitude,
    this.longitude,
    this.profileImage,
    this.firstname,
    this.lastname,
    this.companyName,
    this.countryCode,
    this.hourlyRate,
    this.currencyCode,
    this.roleId,
    this.name,
    this.canPostJob,
    this.profileImageUrl,
    this.isCompany,
    this.role,
  });

  int id;
  String latitude;
  String longitude;
  String profileImage;
  String firstname;
  String lastname;
  dynamic companyName;
  String countryCode;
  int hourlyRate;
  String currencyCode;
  int roleId;
  String name;
  bool canPostJob;
  String profileImageUrl;
  bool isCompany;
  Role role;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        companyName: json["company_name"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        hourlyRate: json["hourly_rate"] == null ? null : json["hourly_rate"],
        currencyCode:
            json["currency_code"] == null ? null : json["currency_code"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        name: json["name"] == null ? null : json["name"],
        canPostJob: json["can_post_job"] == null ? null : json["can_post_job"],
        profileImageUrl: json["profile_image_url"] == null
            ? null
            : json["profile_image_url"],
        isCompany: json["is_company"] == null ? null : json["is_company"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "profile_image": profileImage == null ? null : profileImage,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "company_name": companyName,
        "country_code": countryCode == null ? null : countryCode,
        "hourly_rate": hourlyRate == null ? null : hourlyRate,
        "currency_code": currencyCode == null ? null : currencyCode,
        "role_id": roleId == null ? null : roleId,
        "name": name == null ? null : name,
        "can_post_job": canPostJob == null ? null : canPostJob,
        "profile_image_url": profileImageUrl == null ? null : profileImageUrl,
        "is_company": isCompany == null ? null : isCompany,
        "role": role == null ? null : role.toJson(),
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
  Title title;
  Name name;
  bool canPostJob;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"] == null ? null : json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        title: json["title"] == null ? null : titleValues.map[json["title"]],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        canPostJob: json["can_post_job"] == null ? null : json["can_post_job"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "title": title == null ? null : titleValues.reverse[title],
        "name": name == null ? null : nameValues.reverse[name],
        "can_post_job": canPostJob == null ? null : canPostJob,
      };
}

enum Name { WORKER_INDIVIDUAL }

final nameValues = EnumValues({"worker.individual": Name.WORKER_INDIVIDUAL});

enum Title { FREELANCER }

final titleValues = EnumValues({"Freelancer": Title.FREELANCER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
