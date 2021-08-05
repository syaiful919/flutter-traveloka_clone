import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/repositories/article_repository.dart';
import 'package:traveloka_clone/repositories/product_repository.dart';
import 'package:traveloka_clone/repositories/user_repository.dart';
import 'package:traveloka_clone/services/navigation/navigation_service.dart';

import 'mock.dart';

NavigationService getAndRegisterNavigationServiceMock() {
  if (locator.isRegistered<NavigationService>()) {
    locator.unregister<NavigationService>();
  }
  var service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

ProductRepositoryMock getAndRegisterProductRepositoryMock() {
  if (locator.isRegistered<ProductRepository>()) {
    locator.unregister<ProductRepository>();
  }
  var repository = ProductRepositoryMock();
  locator.registerSingleton<ProductRepository>(repository);
  return repository;
}

UserRepositoryMock getAndRegisterUserRepositoryMock() {
  if (locator.isRegistered<UserRepository>()) {
    locator.unregister<UserRepository>();
  }
  var repository = UserRepositoryMock();
  locator.registerSingleton<UserRepository>(repository);
  return repository;
}

ArticleRepositoryMock getAndRegisterArticleRepositoryMock() {
  if (locator.isRegistered<ArticleRepository>()) {
    locator.unregister<ArticleRepository>();
  }
  var repository = ArticleRepositoryMock();
  locator.registerSingleton<ArticleRepository>(repository);
  return repository;
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterProductRepositoryMock();
  getAndRegisterUserRepositoryMock();
  getAndRegisterArticleRepositoryMock();
}

void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<ProductRepository>();
  locator.unregister<UserRepository>();
  locator.unregister<ArticleRepository>();
}
