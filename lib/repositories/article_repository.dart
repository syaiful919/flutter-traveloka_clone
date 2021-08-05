import 'package:traveloka_clone/models/entities/article_model.dart';
import 'package:traveloka_clone/network/api/article_api.dart';

class ArticleRepository {
  final ArticleApi _api = FakeArticleApi();

  Future<List<ArticleModel>> getRecentNews() => _api.getRecentNews();
}
