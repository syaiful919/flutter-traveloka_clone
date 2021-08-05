import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/models/entities/place_product_model.dart';
import 'package:traveloka_clone/services/navigation/app_router.dart';
import 'package:traveloka_clone/services/navigation/navigation_service.dart';

class PlaceProductDetailViewModel extends BaseViewModel {
  final _nav = locator<NavigationService>();

  PlaceProductModel? place;

  Future<void> firstLoad() async {
    PlaceProductDetailPageArguments arguments = _nav.arguments;
    print(arguments.product);
    place = arguments.product;
    notifyListeners();
  }

  void goBack() => _nav.back();
}
