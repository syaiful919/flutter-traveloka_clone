import 'package:flutter/material.dart';

class ShrinkRow extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const ShrinkRow({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  const ShrinkRow.start({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  const ShrinkRow.end({
    Key? key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}
