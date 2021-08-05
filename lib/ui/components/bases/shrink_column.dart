import 'package:flutter/material.dart';

class ShrinkColumn extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const ShrinkColumn({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  const ShrinkColumn.start({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  const ShrinkColumn.end({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}
