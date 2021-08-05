import 'dart:convert';

List<ArticleModel> listArticleFromJson(String str) => List<ArticleModel>.from(
    json.decode(str).map((x) => ArticleModel.fromJson(x)));

class ArticleModel {
  ArticleModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.url,
  });

  String title;
  String subtitle;
  String image;
  String url;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "image": image,
        "url": url,
      };
}
