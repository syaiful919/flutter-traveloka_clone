import 'package:flutter_test/flutter_test.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/utils/shared_value.dart';

import '../setup/registrations.dart';

void main() {
  late final HomeViewModel viewModel;

  setUpAll(() {
    registerServices();
    viewModel = HomeViewModel();
  });

  tearDownAll(() {
    unregisterServices();
  });

  test('load user profile', () async {
    expect(viewModel.userProfileDS, DataStatus.INITIAL);

    await viewModel.getUserProfile();

    expect(viewModel.userProfileDS, DataStatus.LOADED);
    expect(viewModel.userProfile!.name, "syaiful");
    expect(viewModel.userProfile!.points, 1000);
  });

  test('load categories', () async {
    expect(viewModel.categoriesDS, DataStatus.INITIAL);

    await viewModel.getCategories();

    expect(viewModel.categoriesDS, DataStatus.LOADED);
    expect(viewModel.categories.length, 2);
  });

  test('load empty news', () async {
    expect(viewModel.recentNewsDS, DataStatus.INITIAL);

    await viewModel.getRecentNews();

    expect(viewModel.recentNewsDS, DataStatus.EMPTY);
    expect(viewModel.recentNews.length, 0);
  });
}
