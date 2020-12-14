// To parse this JSON data, do
//
//     final moveSizeModel = moveSizeModelFromJson(jsonString);

import 'dart:convert';

MoveSizeModel moveSizeModelFromJson(String str) =>
    MoveSizeModel.fromJson(json.decode(str));

String moveSizeModelToJson(MoveSizeModel data) => json.encode(data.toJson());

class MoveSizeModel {
  MoveSizeModel({
    this.status,
    this.statuscode,
    this.response,
  });

  String status;
  int statuscode;
  List<Response> response;

  factory MoveSizeModel.fromJson(Map<String, dynamic> json) => MoveSizeModel(
        status: json["status"],
        statuscode: json["statuscode"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statuscode": statuscode,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.id,
    this.name,
    this.status,
    this.position,
  });

  String id;
  String name;
  String status;
  String position;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "position": position,
      };
}
