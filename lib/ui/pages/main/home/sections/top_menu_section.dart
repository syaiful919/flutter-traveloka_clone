import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/ui/components/bases/base_icon_button.dart';
import 'package:traveloka_clone/ui/components/bases/shrink_column.dart';
import 'package:traveloka_clone/ui/components/bases/shrink_row.dart';
import 'package:traveloka_clone/ui/pages/main/home/home_viewmodel.dart';
import 'package:traveloka_clone/utils/project_theme.dart';
import 'dart:math' as math;

import 'package:traveloka_clone/models/core/data.dart';

class TopMenuSection extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return SliverToBoxAdapter(
      child: model.userProfile.status == DataStatus.LOADED
          ? Padding(
              padding: const EdgeInsets.all(Gap.m),
              child: ShrinkColumn(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(model.userProfile.data!.photo),
                        backgroundColor: ProjectColor.greyDivider,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: Gap.s),
                          child: Text(model.userProfile.data!.name,
                              style: TypoStyle.mainBlack600),
                        ),
                      ),
                      ShrinkColumn(
                        children: [
                          BaseIconButton(
                            padding: const EdgeInsets.only(bottom: Gap.xxs),
                            icon: Icon(Icons.qr_code_scanner),
                            onPressed: () {},
                          ),
                          Text(
                            'pindai',
                            style: TypoStyle.smallBlack,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Gap.s),
                  Row(
                    children: [
                      _MenuItem(
                        icon: Icons.money,
                        title: '${model.userProfile.data!.points} points',
                        onPressed: () {},
                      ),
                      _MenuItem(
                        icon: Icons.account_balance_wallet_outlined,
                        title: 'Payment',
                        onPressed: () {},
                      ),
                      _MenuItem(
                        icon: Icons.wallet_travel,
                        title: 'PayLater',
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            )
          : Container(),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const _MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Gap.xs),
      child: GestureDetector(
        onTap: onPressed,
        child: ShrinkRow(children: [
          Icon(
            icon,
            size: IconSize.s,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Gap.xxs),
            child: Text(
              title,
              style: TypoStyle.smallBlack600,
            ),
          ),
          Transform.rotate(
            angle: -math.pi / 2,
            child: Icon(
              Icons.arrow_drop_down,
              size: IconSize.s,
            ),
          )
        ]),
      ),
    );
  }
}
