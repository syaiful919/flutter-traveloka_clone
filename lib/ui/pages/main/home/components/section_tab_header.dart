import 'package:flutter/material.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class SectionTabHeader extends StatelessWidget {
  final List<String> tabs;
  final String selectedTab;
  final Function(String) onSelectTab;

  const SectionTabHeader({
    Key? key,
    required this.selectedTab,
    required this.onSelectTab,
    required this.tabs,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: Gap.m),
      child: SizedBox(
        height: 32,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: tabs.length,
          itemBuilder: (_, i) => _TabBarItem(
            onTap: () => onSelectTab(tabs[i]),
            title: tabs[i],
            isActive: selectedTab == tabs[i],
            isFirst: i == 0,
          ),
        ),
      ),
    );
  }
}

class _TabBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isActive;
  final bool isFirst;

  const _TabBarItem({
    Key? key,
    required this.onTap,
    required this.title,
    this.isActive = false,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: Gap.s),
        margin: EdgeInsets.only(left: isFirst ? Gap.m : Gap.zero, right: Gap.m),
        decoration: BoxDecoration(
          color:
              isActive ? ProjectColor.blue : ProjectColor.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(RadiusSize.s),
        ),
        child: Text(
          title,
          style: isActive ? TypoStyle.mainWhite600 : TypoStyle.mainBlue600,
        ),
      ),
    );
  }
}
