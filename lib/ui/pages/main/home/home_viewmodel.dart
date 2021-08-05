import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/models/entities/article_model.dart';
import 'package:traveloka_clone/models/entities/category_model.dart';
import 'package:traveloka_clone/models/entities/health_product_model.dart';
import 'package:traveloka_clone/models/entities/place_product_model.dart';
import 'package:traveloka_clone/models/entities/user_profile_model.dart';
import 'package:traveloka_clone/repositories/article_repository.dart';
import 'package:traveloka_clone/repositories/product_repository.dart';
import 'package:traveloka_clone/repositories/user_repository.dart';
import 'package:traveloka_clone/services/navigation/app_router.dart';
import 'package:traveloka_clone/services/navigation/navigation_service.dart';
import 'package:traveloka_clone/utils/shared_value.dart';

class HomeViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();

  final _productRepo = locator<ProductRepository>();
  final _userRepo = locator<UserRepository>();
  final _articleRepo = locator<ArticleRepository>();

  UserProfileModel? userProfile;
  List<CategoryModel> categories = [];
  List<PlaceProductModel> popularPlaces = [];
  List<HealthProductGroupModel> _healthProducts = [];
  List<String> healthTabs = [];
  String selectedTab = "";
  List<HealthProductModel> selectedHealthProducts = [];
  List<ArticleModel> recentNews = [];

  DataStatus userProfileDS = DataStatus.INITIAL;
  DataStatus categoriesDS = DataStatus.INITIAL;
  DataStatus popularPlacesDS = DataStatus.INITIAL;
  DataStatus healthProductsDS = DataStatus.INITIAL;
  DataStatus recentNewsDS = DataStatus.INITIAL;

  void firstLoad() async {
    runBusyFuture(getUserProfile());
    runBusyFuture(getCategories());
    runBusyFuture(getHealthProducts());
    runBusyFuture(getPopularPlaces());
    runBusyFuture(getRecentNews());
  }

  Future<void> getUserProfile() async {
    try {
      userProfileDS = DataStatus.LOADING;
      notifyListeners();

      userProfile = await _userRepo.getUserProfile();
      userProfileDS = DataStatus.LOADED;
    } catch (e) {
      userProfileDS = DataStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getCategories() async {
    try {
      categoriesDS = DataStatus.LOADING;
      notifyListeners();

      List<CategoryModel> result = await _productRepo.getCategories();
      if (result.isNotEmpty) {
        categories.addAll(result);
        categoriesDS = DataStatus.LOADED;
      } else {
        categoriesDS = DataStatus.EMPTY;
      }
    } catch (e) {
      categoriesDS = DataStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getHealthProducts() async {
    try {
      healthProductsDS = DataStatus.LOADING;
      notifyListeners();

      List<HealthProductGroupModel> result =
          await _productRepo.getHealthProducts();
      if (result.isNotEmpty) {
        _healthProducts.addAll(result);
        healthTabs = _healthProducts.map((group) => group.type).toList();
        selectedTab = healthTabs[0];
        selectedHealthProducts = _healthProducts
            .firstWhere((group) => group.type == selectedTab)
            .data;

        healthProductsDS = DataStatus.LOADED;
      } else {
        healthProductsDS = DataStatus.EMPTY;
      }
    } catch (e) {
      healthProductsDS = DataStatus.ERROR;
    }
  }

  Future<void> getPopularPlaces() async {
    try {
      popularPlacesDS = DataStatus.LOADING;
      notifyListeners();

      List<PlaceProductModel> result = await _productRepo.getPopularPlaces();
      if (result.isNotEmpty) {
        popularPlaces.addAll(result);
        popularPlacesDS = DataStatus.LOADED;
      } else {
        popularPlacesDS = DataStatus.EMPTY;
      }
    } catch (e) {
      popularPlacesDS = DataStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getRecentNews() async {
    try {
      recentNewsDS = DataStatus.LOADING;
      notifyListeners();

      List<ArticleModel> result = await _articleRepo.getRecentNews();
      if (result.isNotEmpty) {
        recentNews.addAll(result);
        recentNewsDS = DataStatus.LOADED;
      } else {
        recentNewsDS = DataStatus.EMPTY;
      }
    } catch (e) {
      recentNewsDS = DataStatus.ERROR;
    } finally {
      notifyListeners();
      print(recentNews[0].title);
    }
  }

  void changeHealthTab(String type) {
    selectedTab = type;
    selectedHealthProducts =
        _healthProducts.firstWhere((group) => group.type == type).data;

    notifyListeners();
  }

  void goToPlaceDetailPage(PlaceProductModel product) {
    _nav.to(
      Routes.placeProductDetail,
      arguments: PlaceProductDetailPageArguments(product: product),
    );
  }
}
