import 'package:flutter_test/flutter_test.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/models/core/data.dart';

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
    expect(viewModel.userProfile.status, DataStatus.INITIAL);

    await viewModel.getUserProfile();

    expect(viewModel.userProfile.status, DataStatus.LOADED);
    expect(viewModel.userProfile.data!.name, "syaiful");
    expect(viewModel.userProfile.data!.points, 1000);
  });

  test('load categories', () async {
    expect(viewModel.categories.status, DataStatus.INITIAL);

    await viewModel.getCategories();

    expect(viewModel.categories.status, DataStatus.LOADED);
    expect(viewModel.categories.data.length, 2);
  });

  test('load empty news', () async {
    expect(viewModel.recentNews.status, DataStatus.INITIAL);

    await viewModel.getRecentNews();

    expect(viewModel.recentNews.status, DataStatus.EMPTY);
    expect(viewModel.recentNews.data.length, 0);
  });
}
