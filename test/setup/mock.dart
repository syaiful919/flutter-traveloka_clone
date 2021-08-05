import 'package:mockito/mockito.dart';
import 'package:traveloka_clone/models/entities/article_model.dart';
import 'package:traveloka_clone/models/entities/category_model.dart';
import 'package:traveloka_clone/models/entities/user_profile_model.dart';
import 'package:traveloka_clone/repositories/article_repository.dart';
import 'package:traveloka_clone/repositories/product_repository.dart';
import 'package:traveloka_clone/repositories/user_repository.dart';
import 'package:traveloka_clone/services/navigation/navigation_service.dart';
import 'package:traveloka_clone/utils/project_icons.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class NavigationServiceMock extends Mock implements NavigationService {}

class ProductRepositoryMock extends Mock implements ProductRepository {
  @override
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [
      CategoryModel(
        title: 'Tiket Pesawat',
        icon: ProjectIcons.plane,
        color: ProjectColor.blue,
      ),
      CategoryModel(
        title: 'Hotel',
        icon: ProjectIcons.hotel,
        color: ProjectColor.darkBlue,
      ),
    ];
    return categories;
  }
}

class UserRepositoryMock extends Mock implements UserRepository {
  @override
  Future<UserProfileModel> getUserProfile() async {
    return UserProfileModel(name: "syaiful", points: 1000, photo: "");
  }
}

class ArticleRepositoryMock extends Mock implements ArticleRepository {
  @override
  Future<List<ArticleModel>> getRecentNews() async {
    List<ArticleModel> news = [];
    return news;
  }
}
