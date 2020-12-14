import 'dart:convert';

ModelBean modelBeanFromJson(String str) => ModelBean.fromJson(json.decode(str));

String modelBeanToJson(ModelBean data) => json.encode(data.toJson());

class ModelBean {
  ModelBean({
    this.id,
    this.name,
    this.status,
    this.position,
  });

  String id;
  String name;
  String status;
  String position;

  factory ModelBean.fromJson(Map<String, dynamic> json) => ModelBean(
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
