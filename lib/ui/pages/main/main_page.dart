import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/ui/pages/main/account/account_page.dart';
import 'package:traveloka_clone/ui/pages/main/favorites/favorites_page.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_page.dart';
import 'package:traveloka_clone/ui/pages/main/main_viewmodel.dart';
import 'package:traveloka_clone/ui/pages/main/notifications/notifications_page.dart';
import 'package:traveloka_clone/ui/pages/main/transactions/transactions_page.dart';
import 'package:traveloka_clone/utils/project_theme.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      fireOnModelReadyOnce: true,
      viewModelBuilder: () => locator<MainViewModel>(),
      onModelReady: (model) {},
      builder: (_, model, __) => Scaffold(
        body: _getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: model.setIndex,
          currentIndex: model.currentIndex,
          backgroundColor: ProjectColor.whiteOrigin,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ProjectColor.blue,
          unselectedItemColor: ProjectColor.greyDisabled,
          selectedLabelStyle: TypoStyle.smallGrey600,
          unselectedLabelStyle: TypoStyle.smallGrey,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: "Awal",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_outline),
              label: "Simpan",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.feed),
              icon: Icon(Icons.feed_outlined),
              label: "Pesanan",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.notifications),
              icon: Icon(Icons.notifications_outlined),
              label: "Notifikasi",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: "Akun Saya",
            ),
          ],
        ),
      ),
    );
  }
}

Widget _getViewForIndex(int index) {
  switch (index) {
    case 0:
      return HomePage();
    case 1:
      return FavoritesPage();
    case 2:
      return TransactionsPage();
    case 3:
      return NotificationsPage();
    case 4:
      return AccountPage();
    default:
      return HomePage();
  }
}
