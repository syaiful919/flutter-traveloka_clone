import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/dictionaries/places_dictionary.dart';
import 'package:traveloka_clone/models/entities/place_product_model.dart';
import 'package:traveloka_clone/ui/components/bases/shrink_column.dart';
import 'package:traveloka_clone/ui/pages/main/home/components/section_header.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/utils/project_theme.dart';
import 'package:traveloka_clone/extensions/extended_num.dart';
import 'package:traveloka_clone/utils/shared_value.dart';

class PopularPlacesSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return SliverToBoxAdapter(
      child: model.popularPlacesDS == DataStatus.LOADED
          ? ShrinkColumn.start(
              children: [
                SectionHeader(
                  title: PlacesDictionary.popularTitle,
                  subtitle: PlacesDictionary.popularSubtitle,
                  suffixAction: () {},
                ),
                Container(
                  height: 235,
                  margin: EdgeInsets.only(bottom: 2 * Gap.xl),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.popularPlaces.length,
                    itemBuilder: (_, i) => _PlacesItem(
                      product: model.popularPlaces[i],
                      detailAction: (val) => model.goToPlaceDetailPage(val),
                      isFirst: i == 0,
                    ),
                  ),
                )
              ],
            )
          : Container(),
    );
  }
}

class _PlacesItem extends StatelessWidget {
  final Function(PlaceProductModel) detailAction;
  final PlaceProductModel product;
  final bool isFirst;
  const _PlacesItem({
    Key? key,
    required this.product,
    this.isFirst = false,
    required this.detailAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => detailAction(product),
      child: Container(
        width: 150,
        margin: EdgeInsets.only(left: isFirst ? Gap.m : Gap.zero, right: Gap.m),
        child: ShrinkColumn.start(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(RadiusSize.s),
              child: Image.network(
                product.images[0],
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: Gap.s),
            SizedBox(
              height: 32,
              child: Text(
                product.title,
                style: TypoStyle.mainBlack,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: Gap.xs),
            if (product.price != product.originalPrice)
              Padding(
                padding: const EdgeInsets.only(bottom: Gap.xxs),
                child: Text(
                  product.price.idrFormat(),
                  style: TypoStyle.smallGrey
                      .copyWith(decoration: TextDecoration.lineThrough),
                ),
              ),
            Text(product.price.idrFormat(), style: TypoStyle.mainOrange),
          ],
        ),
      ),
    );
  }
}
