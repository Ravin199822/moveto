import 'dart:convert';

EstimatedPricePackingUnpackingModel estimatedPricePackingUnpackingModelFromJson(String str) => EstimatedPricePackingUnpackingModel.fromJson(json.decode(str));

String estimatedPricePackingUnpackingModelToJson(EstimatedPricePackingUnpackingModel data) => json.encode(data.toJson());

class EstimatedPricePackingUnpackingModel {
  EstimatedPricePackingUnpackingModel({
    this.status,
    this.statuscode,
    this.response,
  });

  String status;
  int statuscode;
  List<EstimatedPackingUnpackingModel> response;

  factory EstimatedPricePackingUnpackingModel.fromJson(Map<String, dynamic> json) => EstimatedPricePackingUnpackingModel(
    status: json["status"],
    statuscode: json["statuscode"],
    response: List<EstimatedPackingUnpackingModel>.from(json["response"].map((x) => EstimatedPackingUnpackingModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statuscode": statuscode,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class EstimatedPackingUnpackingModel {
  EstimatedPackingUnpackingModel({
    this.id,
    this.costPacking,
    this.costUnpacking,
    this.distanceId,
  });

  String id;
  String costPacking;
  String costUnpacking;
  String distanceId;

  factory EstimatedPackingUnpackingModel.fromJson(Map<String, dynamic> json) => EstimatedPackingUnpackingModel(
    id: json["id"],
    costPacking: json["cost_packing"],
    costUnpacking: json["cost_unpacking"],
    distanceId: json["distance_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cost_packing": costPacking,
    "cost_unpacking": costUnpacking,
    "distance_id": distanceId,
  };
}
