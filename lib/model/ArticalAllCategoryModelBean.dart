// To parse this JSON data, do
//
//     final articleCategoryModel = articleCategoryModelFromJson(jsonString);

import 'dart:convert';

ArticleCategoryModel articleCategoryModelFromJson(String str) => ArticleCategoryModel.fromJson(json.decode(str));

String articleCategoryModelToJson(ArticleCategoryModel data) => json.encode(data.toJson());

class ArticleCategoryModel {
  ArticleCategoryModel({
    this.status,
    this.statuscode,
    this.response,
  });

  String status;
  int statuscode;
  List<CategoryModelResponse> response;

  factory ArticleCategoryModel.fromJson(Map<String, dynamic> json) => ArticleCategoryModel(
    status: json["status"],
    statuscode: json["statuscode"],
    response: List<CategoryModelResponse>.from(json["response"].map((x) => CategoryModelResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statuscode": statuscode,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class CategoryModelResponse {
  CategoryModelResponse({
    this.id,
    this.name,
    this.status,
    this.articleId,
    this.roomTypeId,
  });

  String id;
  String name;
  String status;
  String articleId;
  String roomTypeId;

  factory CategoryModelResponse.fromJson(Map<String, dynamic> json) => CategoryModelResponse(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    articleId: json["article_id"],
    roomTypeId: json["room_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "article_id": articleId,
    "room_type_id": roomTypeId,
  };
}
