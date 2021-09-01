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
import 'package:traveloka_clone/models/core/data.dart';

class HomeViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();

  final _productRepo = locator<ProductRepository>();
  final _userRepo = locator<UserRepository>();
  final _articleRepo = locator<ArticleRepository>();

  List<HealthProductGroupModel> _healthProducts = [];
  List<String> healthTabs = [];
  String selectedTab = "";
  List<HealthProductModel> selectedHealthProducts = [];

  Data<List<CategoryModel>> categories = Data([]);
  Data<List<PlaceProductModel>> popularPlaces = Data([]);
  Data<UserProfileModel?> userProfile = Data(null);
  Data<List<ArticleModel>> recentNews = Data([]);

  DataStatus healthProductsDS = DataStatus.INITIAL;

  void firstLoad() async {
    runBusyFuture(getUserProfile());
    runBusyFuture(getCategories());
    runBusyFuture(getHealthProducts());
    runBusyFuture(getPopularPlaces());
    runBusyFuture(getRecentNews());
  }

  Future<void> getUserProfile() async {
    try {
      userProfile.status = DataStatus.LOADING;
      notifyListeners();

      userProfile.data = await _userRepo.getUserProfile();
      userProfile.status = DataStatus.LOADED;
    } catch (e) {
      userProfile.status = DataStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getCategories() async {
    try {
      categories.status = DataStatus.LOADING;
      notifyListeners();

      List<CategoryModel> result = await _productRepo.getCategories();
      if (result.isNotEmpty) {
        categories.data.addAll(result);
        categories.status = DataStatus.LOADED;
      } else {
        categories.status = DataStatus.EMPTY;
      }
    } catch (e) {
      categories.status = DataStatus.ERROR;
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
      popularPlaces.status = DataStatus.LOADING;
      notifyListeners();

      List<PlaceProductModel> result = await _productRepo.getPopularPlaces();
      if (result.isNotEmpty) {
        popularPlaces.data.addAll(result);
        popularPlaces.status = DataStatus.LOADED;
      } else {
        popularPlaces.status = DataStatus.EMPTY;
      }
    } catch (e) {
      popularPlaces.status = DataStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getRecentNews() async {
    try {
      recentNews.status = DataStatus.LOADING;
      notifyListeners();

      List<ArticleModel> result = await _articleRepo.getRecentNews();
      if (result.isNotEmpty) {
        recentNews.data.addAll(result);
        recentNews.status = DataStatus.LOADED;
      } else {
        recentNews.status = DataStatus.EMPTY;
      }
    } catch (e) {
      recentNews.status = DataStatus.ERROR;
    } finally {
      notifyListeners();
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
