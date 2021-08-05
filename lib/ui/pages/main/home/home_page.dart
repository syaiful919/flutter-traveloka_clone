import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/ui/components/atoms/search_input.dart';
import 'package:traveloka_clone/ui/components/bases/base_icon_button.dart';
import 'package:traveloka_clone/ui/pages/main/home/components/floating_menu.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/ui/pages/main/home/sections/categories_section.dart';
import 'package:traveloka_clone/ui/pages/main/home/sections/health_section.dart';
import 'package:traveloka_clone/ui/pages/main/home/sections/popular_places_section.dart';
import 'package:traveloka_clone/ui/pages/main/home/sections/recent_news_section.dart';
import 'package:traveloka_clone/ui/pages/main/home/sections/top_menu_section.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _mainScroll = ScrollController();
  bool _showFloatingMenu = false;

  @override
  void initState() {
    super.initState();
    _mainScroll.addListener(() {
      if (_mainScroll.offset > 300 && !_showFloatingMenu) {
        setState(() {
          _showFloatingMenu = true;
        });
      } else if (_mainScroll.offset < 300 && _showFloatingMenu) {
        setState(() {
          _showFloatingMenu = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _mainScroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      fireOnModelReadyOnce: true,
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (model) => model.firstLoad(),
      builder: (_, model, __) => Scaffold(
          backgroundColor: ProjectColor.whiteOrigin,
          appBar: AppBar(
            title: SearchInput(),
            actions: [
              BaseIconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              ),
              BaseIconButton(
                icon: Icon(Icons.chat_bubble_outline),
                onPressed: () {},
              ),
            ],
          ),
          body: Stack(
            children: [
              CustomScrollView(
                controller: _mainScroll,
                slivers: [
                  TopMenuSection(),
                  CategoriesSection(),
                  HealthSection(),
                  PopularPlacesSection(),
                  RecentNewsSection(),
                ],
              ),
              if (_showFloatingMenu)
                Align(
                  alignment: Alignment.topCenter,
                  child: FloatingMenu(
                    planeAction: () {},
                    hotelAction: () {},
                    experienceAction: () {},
                    busAction: () {},
                    trainAction: () {},
                    moreAction: () {},
                  ),
                )
            ],
          )),
    );
  }
}
