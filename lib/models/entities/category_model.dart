import 'package:flutter/material.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class CategoryModel {
  final String title;
  final String icon;
  final Color color;

  CategoryModel({
    required this.title,
    required this.icon,
    this.color = ProjectColor.whiteOrigin,
  });
}
