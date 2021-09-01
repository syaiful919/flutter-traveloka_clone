import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/dictionaries/article_dictionary.dart';
import 'package:traveloka_clone/models/entities/article_model.dart';
import 'package:traveloka_clone/ui/components/bases/shrink_column.dart';
import 'package:traveloka_clone/ui/pages/main/home/components/section_header.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/utils/project_theme.dart';
import 'package:traveloka_clone/models/core/data.dart';

class RecentNewsSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return SliverToBoxAdapter(
      child: model.recentNews.status == DataStatus.LOADED
          ? ShrinkColumn.start(
              children: [
                SectionHeader(
                  title: ArticleDictionary.recentNewsTitle,
                  subtitle: ArticleDictionary.recentNewsSubtitle,
                ),
                Container(
                  height: 205,
                  margin: EdgeInsets.only(bottom: 2 * Gap.xl),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.recentNews.data.length,
                    itemBuilder: (_, i) => _ArticleItem(
                      article: model.recentNews.data[i],
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

class _ArticleItem extends StatelessWidget {
  final ArticleModel article;
  final bool isFirst;
  const _ArticleItem({
    Key? key,
    required this.article,
    this.isFirst = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(left: isFirst ? Gap.m : Gap.zero, right: Gap.m),
      child: ShrinkColumn.start(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(RadiusSize.s),
            child: Image.network(
              article.image,
              height: 150,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: Gap.s),
          Text(
            article.title,
            style: TypoStyle.mainBlack,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Gap.xs),
          Text(
            article.subtitle,
            style: TypoStyle.mainOrange,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
