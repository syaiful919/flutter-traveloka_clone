import 'package:flutter/services.dart';
import 'package:traveloka_clone/models/entities/article_model.dart';

class FakeArticleApi implements ArticleApi {
  @override
  Future<List<ArticleModel>> getRecentNews() async {
    String data = await rootBundle.loadString('assets/json/recent_news.json');
    return listArticleFromJson(data);
  }
}

abstract class ArticleApi {
  Future<List<ArticleModel>> getRecentNews();
}
