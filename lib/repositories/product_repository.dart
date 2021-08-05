import 'package:traveloka_clone/models/entities/category_model.dart';
import 'package:traveloka_clone/models/entities/health_product_model.dart';
import 'package:traveloka_clone/models/entities/place_product_model.dart';
import 'package:traveloka_clone/network/api/product_api.dart';
import 'package:traveloka_clone/utils/project_icons.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class ProductRepository {
  final ProductApi _api = FakeProductApi();

  Future<List<HealthProductGroupModel>> getHealthProducts() =>
      _api.getHealthProducts();

  Future<List<PlaceProductModel>> getPopularPlaces() => _api.getPopularPlaces();

  Future<List<CategoryModel>> getCategories() => Future.value(_categories);
}

List<CategoryModel> _categories = [
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
  CategoryModel(
    title: 'Antar Jemput Bandara',
    icon: ProjectIcons.airport,
    color: ProjectColor.darkGreen,
  ),
  CategoryModel(
    title: 'Xperience',
    icon: ProjectIcons.experience,
    color: ProjectColor.salmon,
  ),
  CategoryModel(
    title: 'Tiket Bus & Travel',
    icon: ProjectIcons.bus,
    color: ProjectColor.green,
  ),
  CategoryModel(
    title: 'Rental Mobil',
    icon: ProjectIcons.car,
    color: ProjectColor.darkGreen,
  ),
  CategoryModel(
    title: 'Tiket Kereta Api',
    icon: ProjectIcons.train,
    color: ProjectColor.orange,
  ),
  CategoryModel(
    title: 'Gift Voucher',
    icon: ProjectIcons.gift,
    color: ProjectColor.red,
  ),
  CategoryModel(
    title: 'Promo',
    icon: ProjectIcons.promo,
    color: ProjectColor.red,
  ),
  CategoryModel(
    title: 'Semua produk',
    icon: ProjectIcons.menu,
    color: ProjectColor.greyDivider,
  ),
  CategoryModel(
    title: 'Pesawat + Hotel',
    icon: ProjectIcons.flight,
  ),
  CategoryModel(
    title: 'Kesehatan',
    icon: ProjectIcons.health,
  ),
  CategoryModel(
    title: 'Loyalty Points',
    icon: ProjectIcons.loyalty,
  ),
  CategoryModel(
    title: 'Paylater',
    icon: ProjectIcons.paylater,
  ),
  CategoryModel(
    title: 'Top Up',
    icon: ProjectIcons.topup,
  ),
];
