// To parse this JSON data, do
//
//     final loadingFloorNoModel = loadingFloorNoModelFromJson(jsonString);

import 'dart:convert';

LoadingFloorNoModel loadingFloorNoModelFromJson(String str) => LoadingFloorNoModel.fromJson(json.decode(str));

String loadingFloorNoModelToJson(LoadingFloorNoModel data) => json.encode(data.toJson());

class LoadingFloorNoModel {
  LoadingFloorNoModel({
    this.status,
    this.statuscode,
    this.response,
  });

  String status;
  int statuscode;
  List<FloorModel> response;

  factory LoadingFloorNoModel.fromJson(Map<String, dynamic> json) => LoadingFloorNoModel(
    status: json["status"],
    statuscode: json["statuscode"],
    response: List<FloorModel>.from(json["response"].map((x) => FloorModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statuscode": statuscode,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class FloorModel {
  FloorModel({
    this.id,
    this.price,
    this.distanceId,
    this.floorNo,
    this.statusPricing,
  });

  String id;
  String price;
  String distanceId;
  String floorNo;
  String statusPricing;

  factory FloorModel.fromJson(Map<String, dynamic> json) => FloorModel(
    id: json["id"],
    price: json["price"],
    distanceId: json["distance_id"],
    floorNo: json["floor_no"],
    statusPricing: json["status_pricing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "distance_id": distanceId,
    "floor_no": floorNo,
    "status_pricing": statusPricing,
  };
}
