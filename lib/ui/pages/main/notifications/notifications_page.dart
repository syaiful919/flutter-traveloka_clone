import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/ui/components/atoms/search_input.dart';
import 'package:traveloka_clone/ui/components/bases/base_icon_button.dart';
import 'package:traveloka_clone/ui/pages/main/notifications/notifications_viewmodel.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      fireOnModelReadyOnce: true,
      viewModelBuilder: () => locator<NotificationsViewModel>(),
      onModelReady: (model) {},
      builder: (_, model, __) => Scaffold(
        appBar: AppBar(
          title: SearchInput(),
          actions: [
            BaseIconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
            BaseIconButton(
              icon: Icon(Icons.chat_bubble_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
