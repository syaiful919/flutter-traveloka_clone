import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:traveloka_clone/dictionaries/health_dictionary.dart';
import 'package:traveloka_clone/models/entities/health_product_model.dart';
import 'package:traveloka_clone/ui/components/bases/shrink_column.dart';
import 'package:traveloka_clone/ui/pages/main/home/components/section_header.dart';
import 'package:traveloka_clone/ui/pages/main/home/components/section_tab_header.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/utils/project_theme.dart';
import 'package:traveloka_clone/extensions/extended_num.dart';
import 'package:traveloka_clone/utils/shared_value.dart';

class HealthSection extends HookViewModelWidget<HomeViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel model) {
    var horizontalScroll = useScrollController();

    return SliverToBoxAdapter(
      child: model.healthProductsDS == DataStatus.LOADED
          ? ShrinkColumn.start(
              children: [
                SectionHeader(
                  title: HealthDictionary.homeTitle,
                  subtitle: HealthDictionary.homeSubtitle,
                  suffixAction: () {},
                ),
                SectionTabHeader(
                  tabs: model.healthTabs,
                  selectedTab: model.selectedTab,
                  onSelectTab: (val) {
                    model.changeHealthTab(val);
                    horizontalScroll.jumpTo(0);
                  },
                ),
                Container(
                  height: 205,
                  margin: EdgeInsets.only(bottom: 2 * Gap.xl),
                  child: ListView.builder(
                    controller: horizontalScroll,
                    scrollDirection: Axis.horizontal,
                    itemCount: model.selectedHealthProducts.length,
                    itemBuilder: (_, i) => _HealthItem(
                      product: model.selectedHealthProducts[i],
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

class _HealthItem extends StatelessWidget {
  final HealthProductModel product;
  final bool isFirst;
  const _HealthItem({
    Key? key,
    required this.product,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(
            product.title,
            style: TypoStyle.mainBlack,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Gap.xs),
          Text(product.price.idrFormat(), style: TypoStyle.mainOrange),
        ],
      ),
    );
  }
}
