// To parse this JSON data, do
//
//     final loginPageModel = loginPageModelFromJson(jsonString);

import 'dart:convert';

LoginPageModel loginPageModelFromJson(String str) =>
    LoginPageModel.fromJson(json.decode(str));

String loginPageModelToJson(LoginPageModel data) => json.encode(data.toJson());

class LoginPageModel {
  LoginPageModel({
    this.status,
    this.statuscode,
    this.response,
  });

  String status;
  int statuscode;
  Response response;

  factory LoginPageModel.fromJson(Map<String, dynamic> json) => LoginPageModel(
        status: json["status"],
        statuscode: json["statuscode"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statuscode": statuscode,
        "response": response.toJson(),
      };
}

class Response {
  Response({
    this.data,
    this.id,
    this.caps,
    this.capKey,
    this.roles,
    this.allcaps,
    this.filter,
  });

  Data data;
  int id;
  Caps caps;
  String capKey;
  List<String> roles;
  Allcaps allcaps;
  dynamic filter;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        data: Data.fromJson(json["data"]),
        id: json["ID"],
        caps: Caps.fromJson(json["caps"]),
        capKey: json["cap_key"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        allcaps: Allcaps.fromJson(json["allcaps"]),
        filter: json["filter"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "ID": id,
        "caps": caps.toJson(),
        "cap_key": capKey,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "allcaps": allcaps.toJson(),
        "filter": filter,
      };
}

class Allcaps {
  Allcaps({
    this.read,
    this.level0,
    this.subscriber,
  });

  bool read;
  bool level0;
  bool subscriber;

  factory Allcaps.fromJson(Map<String, dynamic> json) => Allcaps(
        read: json["read"],
        level0: json["level_0"],
        subscriber: json["subscriber"],
      );

  Map<String, dynamic> toJson() => {
        "read": read,
        "level_0": level0,
        "subscriber": subscriber,
      };
}

class Caps {
  Caps({
    this.subscriber,
  });

  bool subscriber;

  factory Caps.fromJson(Map<String, dynamic> json) => Caps(
        subscriber: json["subscriber"],
      );

  Map<String, dynamic> toJson() => {
        "subscriber": subscriber,
      };
}

class Data {
  Data({
    this.id,
    this.userLogin,
    this.userPass,
    this.userNicename,
    this.userEmail,
    this.userUrl,
    this.userRegistered,
    this.userActivationKey,
    this.userStatus,
    this.displayName,
  });

  String id;
  String userLogin;
  String userPass;
  String userNicename;
  String userEmail;
  String userUrl;
  DateTime userRegistered;
  String userActivationKey;
  String userStatus;
  String displayName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        userLogin: json["user_login"],
        userPass: json["user_pass"],
        userNicename: json["user_nicename"],
        userEmail: json["user_email"],
        userUrl: json["user_url"],
        userRegistered: DateTime.parse(json["user_registered"]),
        userActivationKey: json["user_activation_key"],
        userStatus: json["user_status"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "user_login": userLogin,
        "user_pass": userPass,
        "user_nicename": userNicename,
        "user_email": userEmail,
        "user_url": userUrl,
        "user_registered": userRegistered.toIso8601String(),
        "user_activation_key": userActivationKey,
        "user_status": userStatus,
        "display_name": displayName,
      };
}
