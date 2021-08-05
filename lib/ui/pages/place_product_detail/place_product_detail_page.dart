import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/ui/components/bases/base_icon_button.dart';
import 'package:traveloka_clone/ui/pages/place_product_detail/place_product_detail_viewmodel.dart';
import 'package:traveloka_clone/utils/project_theme.dart';

class PlaceProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaceProductDetailViewModel>.reactive(
      onModelReady: (model) => model.firstLoad(),
      viewModelBuilder: () => PlaceProductDetailViewModel(),
      builder: (_, model, __) => Scaffold(
        appBar: AppBar(
          title: Text(
            model.place == null ? "" : model.place!.title,
            style: TypoStyle.titleWhite,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: ProjectColor.salmon,
          titleSpacing: 0,
          leading: BaseIconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ProjectColor.whiteOrigin,
            ),
            onPressed: () => model.goBack(),
          ),
        ),
      ),
    );
  }
}
