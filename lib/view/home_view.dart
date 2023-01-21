import 'package:flutter/material.dart';
import '../view_model/home_view_model.dart';
import 'package:stacked/stacked.dart';

import '../widget/app_bar.dart';
import '../widget/drawer.dart';

class HomeView extends StatelessWidget {
  static const route = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: const WhatsHafizAppBar(
      title:"WhatsHafız",
    ),
          drawer: drawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(viewModel.selectedIndex.toString()),
              InkWell(
                onTap: () {
                  final snackBar = SnackBar(
                    content: Text('new number: ${viewModel.selectedIndex.toString()}'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  viewModel.onItemTapped();
                },
                child: const Text("bas"),
              )
            ],
          ),
        );
      },
    );
  }
}
