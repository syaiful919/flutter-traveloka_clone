import 'package:flutter/material.dart';
import 'package:traveloka_clone/ui/components/bases/base_icon_button.dart';
import 'package:traveloka_clone/ui/components/bases/shrink_column.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? suffixAction;

  const SectionHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    this.suffixAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(Gap.m, Gap.zero, Gap.m, Gap.m),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
              child: ShrinkColumn.start(children: [
            Text(
              title,
              style: TypoStyle.titleBlack600,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: Gap.xs),
            Text(
              subtitle,
              style: TypoStyle.mainGrey,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ])),
          if (suffixAction != null)
            BaseIconButton(
              padding: EdgeInsets.only(left: Gap.m),
              icon: Icon(
                Icons.arrow_forward_ios,
                size: IconSize.s,
              ),
              onPressed: suffixAction,
            )
        ],
      ),
    );
  }
}
