import 'package:flutter/services.dart';
import 'package:traveloka_clone/models/entities/health_product_model.dart';
import 'package:traveloka_clone/models/entities/place_product_model.dart';

class FakeProductApi implements ProductApi {
  Future<List<HealthProductGroupModel>> getHealthProducts() async {
    String data =
        await rootBundle.loadString('assets/json/health_products.json');
    return listHealthProductGroupFromJson(data);
  }

  Future<List<PlaceProductModel>> getPopularPlaces() async {
    String data =
        await rootBundle.loadString('assets/json/place_products.json');
    return listPlaceProductFromJson(data);
  }
}

abstract class ProductApi {
  Future<List<HealthProductGroupModel>> getHealthProducts();
  Future<List<PlaceProductModel>> getPopularPlaces();
}
