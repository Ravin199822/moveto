import 'dart:convert';

ArticleRoomModelBean modelBeanFromJson(String str) => ArticleRoomModelBean.fromJson(json.decode(str));

String modelBeanToJson(ArticleRoomModelBean data) => json.encode(data.toJson());

class ArticleRoomModelBean {
  ArticleRoomModelBean({
    this.id,
    this.name,
    // this.status,
    // this.position,
  });

  String id;
  String name;
  // String status;
  // String position;

  factory ArticleRoomModelBean.fromJson(Map<String, dynamic> json) => ArticleRoomModelBean(
    id: json["id"],
    name: json["name"],
    // status: json["status"],
    // position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    // "status": status,
    // "position": position,
  };
}
