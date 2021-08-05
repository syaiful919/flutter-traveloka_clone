import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:traveloka_clone/utils/project_icons.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class FloatingMenu extends StatelessWidget {
  final VoidCallback planeAction;
  final VoidCallback hotelAction;
  final VoidCallback experienceAction;
  final VoidCallback busAction;
  final VoidCallback trainAction;
  final VoidCallback moreAction;

  const FloatingMenu({
    Key? key,
    required this.planeAction,
    required this.hotelAction,
    required this.experienceAction,
    required this.busAction,
    required this.trainAction,
    required this.moreAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Gap.m),
      width: MediaQuery.of(context).size.width,
      child: PlayAnimation<double>(
        tween: Tween<double>(begin: -50, end: 0),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, child, value) {
          return Transform.translate(
            offset: Offset(0, value),
            child: child,
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Gap.s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MenuItem(
                  icon: ProjectIcons.plane,
                  onPressed: planeAction,
                ),
                _MenuItem(
                  icon: ProjectIcons.hotel,
                  color: ProjectColor.darkBlue,
                  onPressed: hotelAction,
                ),
                _MenuItem(
                  icon: ProjectIcons.experience,
                  color: ProjectColor.salmon,
                  onPressed: experienceAction,
                ),
                _MenuItem(
                  icon: ProjectIcons.bus,
                  color: ProjectColor.green,
                  onPressed: busAction,
                ),
                _MenuItem(
                  icon: ProjectIcons.train,
                  color: ProjectColor.orange,
                  onPressed: trainAction,
                ),
                _MenuItem(
                  icon: ProjectIcons.menu,
                  color: ProjectColor.blackOrigin,
                  onPressed: moreAction,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final Color color;

  const _MenuItem({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = ProjectColor.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        icon,
        color: color,
        height: IconSize.m,
        width: IconSize.m,
      ),
    );
  }
}
