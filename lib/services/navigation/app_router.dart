import 'package:traveloka_clone/models/entities/place_product_model.dart';
import 'package:traveloka_clone/ui/pages/main/main_page.dart';
import 'package:get/get.dart';
import 'package:traveloka_clone/ui/pages/place_product_detail/place_product_detail_page.dart';

class AppRouter {
  static List<GetPage> routeList = [
    GetPage(name: Routes.main, page: () => MainPage()),
    GetPage(
        name: Routes.placeProductDetail, page: () => PlaceProductDetailPage()),
  ];
}

class Routes {
  static const String main = '/main';
  static const String placeProductDetail = '/place-product-detail';
}

// -------- ARGUMENTS HOLDER ---------

class PlaceProductDetailPageArguments {
  final PlaceProductModel product;

  PlaceProductDetailPageArguments({required this.product});
}
