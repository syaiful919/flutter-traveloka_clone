import 'package:flutter/material.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class BaseIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;

  const BaseIconButton({
    required this.icon,
    required this.onPressed,
    this.padding = const EdgeInsets.all(Gap.s),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Container(
        child: icon,
        padding: padding,
      ),
    );
  }
}
