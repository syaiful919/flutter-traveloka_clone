import 'dart:convert';

List<HealthProductGroupModel> listHealthProductGroupFromJson(String str) =>
    List<HealthProductGroupModel>.from(
        json.decode(str).map((x) => HealthProductGroupModel.fromJson(x)));

class HealthProductGroupModel {
  HealthProductGroupModel({
    required this.type,
    required this.data,
  });

  String type;
  List<HealthProductModel> data;

  factory HealthProductGroupModel.fromJson(Map<String, dynamic> json) =>
      HealthProductGroupModel(
        type: json["type"],
        data: List<HealthProductModel>.from(
            json["data"].map((x) => HealthProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HealthProductModel {
  HealthProductModel({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  int id;
  List<String> images;
  int price;
  String title;

  factory HealthProductModel.fromJson(Map<String, dynamic> json) =>
      HealthProductModel(
        id: json["id"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "title": title,
      };
}
