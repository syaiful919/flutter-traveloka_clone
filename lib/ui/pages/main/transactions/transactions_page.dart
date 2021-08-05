import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:traveloka_clone/locator/locator.dart';
import 'package:traveloka_clone/ui/components/atoms/search_input.dart';
import 'package:traveloka_clone/ui/components/bases/base_icon_button.dart';
import 'package:traveloka_clone/ui/pages/main/transactions/transactions_viewmodel.dart';

class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionsViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      fireOnModelReadyOnce: true,
      viewModelBuilder: () => locator<TransactionsViewModel>(),
      onModelReady: (model) {},
      builder: (_, model, __) => Scaffold(
        appBar: AppBar(
          title: SearchInput(),
          actions: [
            BaseIconButton(
              icon: Icon(Icons.list_outlined),
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
