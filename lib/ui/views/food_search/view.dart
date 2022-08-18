import 'package:flutter/material.dart';
import 'package:food_picture_generator/navigation/pages.dart';
import 'package:food_picture_generator/ui/base/base_view.dart';
import 'package:food_picture_generator/ui/views/food_search/view_model.dart';

class FoodSearch extends StatefulWidget {
  const FoodSearch({Key? key}) : super(key: key);
  static MaterialPage page() => MaterialPage(
        name: AppPages.foodSearchPath,
        key: ValueKey(AppPages.foodSearchPath),
        child: const FoodSearch(),
      );

  @override
  State<FoodSearch> createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FoodSearchViewModel>(
        model: FoodSearchViewModel(),
        onDispose: (model) => model.dispose(),
        onModelReady: (model) => model.init(context),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Scaffold(
              body: Column(
                children: [],
              ),
            ),
          );
        });
  }
}
