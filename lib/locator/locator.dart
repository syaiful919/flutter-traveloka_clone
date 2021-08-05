import 'package:traveloka_clone/repositories/article_repository.dart';
import 'package:traveloka_clone/repositories/product_repository.dart';
import 'package:traveloka_clone/repositories/user_repository.dart';
import 'package:traveloka_clone/services/navigation/navigation_service.dart';
import 'package:traveloka_clone/ui/pages/main/account/account_viewmodel.dart';
import 'package:traveloka_clone/ui/pages/main/favorites/favorites_viewmodel.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/ui/pages/main/main_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:traveloka_clone/ui/pages/main/notifications/notifications_viewmodel.dart';
import 'package:traveloka_clone/ui/pages/main/transactions/transactions_viewmodel.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // -------- SERVICES -------- //
  locator.registerSingleton<NavigationService>(NavigationService());

  // -------- REPOSITORIES -------- //
  locator.registerLazySingleton<ProductRepository>(() => ProductRepository());
  locator.registerLazySingleton<UserRepository>(() => UserRepository());
  locator.registerLazySingleton<ArticleRepository>(() => ArticleRepository());

  // -------- NON DISPOSABLE VIEWMODELS -------- //
  locator.registerSingleton<MainViewModel>(MainViewModel());
  locator.registerSingleton<HomeViewModel>(HomeViewModel());
  locator.registerSingleton<FavoritesViewModel>(FavoritesViewModel());
  locator.registerSingleton<TransactionsViewModel>(TransactionsViewModel());
  locator.registerSingleton<NotificationsViewModel>(NotificationsViewModel());
  locator.registerSingleton<AccountViewModel>(AccountViewModel());
}
