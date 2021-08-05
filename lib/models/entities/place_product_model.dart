import 'dart:convert';

List<PlaceProductModel> listPlaceProductFromJson(String str) =>
    List<PlaceProductModel>.from(
        json.decode(str).map((x) => PlaceProductModel.fromJson(x)));

class PlaceProductModel {
  PlaceProductModel({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
    required this.region,
    required this.originalPrice,
  });

  int id;
  List<String> images;
  int price;
  String title;
  String region;
  int originalPrice;

  factory PlaceProductModel.fromJson(Map<String, dynamic> json) =>
      PlaceProductModel(
        id: json["id"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["price"],
        title: json["title"],
        region: json["region"],
        originalPrice: json["original_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x)),
        "price": price,
        "title": title,
        "region": region,
        "original_price": originalPrice,
      };
}
