import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/models/entities/category_model.dart';
import 'package:traveloka_clone/ui/components/bases/shrink_column.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/utils/project_theme.dart';
import 'package:traveloka_clone/models/core/data.dart';

class CategoriesSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return SliverToBoxAdapter(
      child: model.categories.status == DataStatus.LOADED
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 80,
                maxCrossAxisExtent: 75,
                crossAxisSpacing: Gap.s,
                mainAxisSpacing: Gap.s,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, i) => _CategoryItem(
                category: model.categories.data[i],
                onPressed: (val) {},
              ),
              itemCount: model.categories.data.length,
              padding:
                  const EdgeInsets.fromLTRB(Gap.m, Gap.m, Gap.m, 2 * Gap.xl),
            )
          : Container(),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Function(String) onPressed;

  const _CategoryItem({
    Key? key,
    required this.category,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(category.title),
      child: Container(
        child: ShrinkColumn(
          children: [
            CircleAvatar(
              backgroundColor: category.color,
              child: SvgPicture.asset(
                category.icon,
                width: IconSize.m,
                height: IconSize.m,
                color: category.color == ProjectColor.whiteOrigin
                    ? ProjectColor.greyText
                    : null,
              ),
            ),
            SizedBox(height: Gap.xxs),
            Text(
              category.title,
              style: TypoStyle.smallGrey,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
