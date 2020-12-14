// To parse this JSON data, do
//
//     final articleAllModel = articleAllModelFromJson(jsonString);

import 'dart:convert';

ArticleAllModel articleAllModelFromJson(String str) => ArticleAllModel.fromJson(json.decode(str));

String articleAllModelToJson(ArticleAllModel data) => json.encode(data.toJson());

class ArticleAllModel {
  ArticleAllModel({
    this.status,
    this.statuscode,
    this.response,
  });

  String status;
  int statuscode;
  List<ArticleAllModelResponse> response;

  factory ArticleAllModel.fromJson(Map<String, dynamic> json) => ArticleAllModel(
    status: json["status"],
    statuscode: json["statuscode"],
    response: List<ArticleAllModelResponse>.from(json["response"].map((x) => ArticleAllModelResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statuscode": statuscode,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class ArticleAllModelResponse {
  ArticleAllModelResponse({
    this.id,
    this.articleName,
    this.type,
    this.price,
    this.image,
    this.predefinedimage,
    this.maxQty,
    this.status,
    this.position,
    this.cubicarea,
    // this.qty,
  });

  String id;
  String articleName;
  Type type;
  String price;
  String image;
  String predefinedimage;
  String maxQty;
  Status status;
  String position;
  String cubicarea;
  int qty=0;

  factory ArticleAllModelResponse.fromJson(Map<String, dynamic> json) => ArticleAllModelResponse(
    id: json["id"],
    articleName: json["article_name"],
    type: typeValues.map[json["type"]],
    price: json["price"],
    image: json["image"],
    predefinedimage: json["predefinedimage"],
    maxQty: json["max_qty"],
    status: statusValues.map[json["status"]],
    position: json["position"],
    cubicarea: json["cubicarea"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "article_name": articleName,
    "type": typeValues.reverse[type],
    "price": price,
    "image": image,
    "predefinedimage": predefinedimage,
    "max_qty": maxQty,
    "status": statusValues.reverse[status],
    "position": position,
    "cubicarea": cubicarea,
  };
}

enum Status { E }

final statusValues = EnumValues({
  "E": Status.E
});

enum Type { P }

final typeValues = EnumValues({
  "P": Type.P
});

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
