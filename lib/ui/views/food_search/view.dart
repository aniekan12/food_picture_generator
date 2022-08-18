import 'package:flutter/material.dart';
import 'package:food_picture_generator/navigation/pages.dart';
import 'package:food_picture_generator/ui/base/base_view.dart';
import 'package:food_picture_generator/ui/views/food_search/view_model.dart';
import 'package:food_picture_generator/ui/widgets/app_button.dart';
import 'package:food_picture_generator/ui/widgets/custom_app_bar.dart';
import 'package:food_picture_generator/ui/widgets/custom_textfield.dart';

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
            appBar: FoodSearchAppBar.show(title: 'Food Search', showBack: true),
            backgroundColor: Theme.of(context).backgroundColor,
            body: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    CustomTextField(
                        controller: model.foodNameController,
                        onChanged: (str) => model.foodNameOnChanged(str),
                        hintText: 'Enter Food Name',
                        labelText: 'Food Name'),
                    const SizedBox(height: 20),
                    AppButton(
                        isActive: model.textFieldIsEmpty,
                        onTap: () {},
                        buttonText: 'Search'),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
