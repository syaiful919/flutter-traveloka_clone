import 'package:traveloka_clone/services/navigation/app_router.dart';
import 'package:get/get.dart';

class NavigationService {
  Map<String, String?> get parameters => Get.parameters;
  dynamic get arguments => Get.arguments;

  void back({dynamic result}) => Get.back(result: result);

  Future<dynamic>? to(
    String routeName, {
    Map<String, String>? params,
    dynamic arguments,
  }) =>
      Get.toNamed(routeName, parameters: params, arguments: arguments);

  Future<dynamic>? off(
    String routeName, {
    Map<String, String>? params,
    dynamic arguments,
  }) =>
      Get.offNamed(routeName, parameters: params, arguments: arguments);

  Future<dynamic>? offAll(
    String routeName, {
    Map<String, String>? params,
    dynamic arguments,
  }) =>
      Get.offAllNamed(routeName, parameters: params, arguments: arguments);

  Future<dynamic>? backToRoot() => Get.offAllNamed(Routes.main);
}
