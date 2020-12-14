// To parse this JSON data, do
//
//     final roomTypeModel = roomTypeModelFromJson(jsonString);

import 'dart:convert';

RoomTypeModel roomTypeModelFromJson(String str) => RoomTypeModel.fromJson(json.decode(str));

String roomTypeModelToJson(RoomTypeModel data) => json.encode(data.toJson());

class RoomTypeModel {
  RoomTypeModel({
    this.status,
    this.statuscode,
    this.response,
  });

  String status;
  int statuscode;
  List<Response> response;

  factory RoomTypeModel.fromJson(Map<String, dynamic> json) => RoomTypeModel(
    status: json["status"],
    statuscode: json["statuscode"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
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
  });

  String id;
  String name;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
