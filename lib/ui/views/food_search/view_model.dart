import 'package:flutter/material.dart';
import 'package:food_picture_generator/ui/base/base_view_model.dart';

class FoodSearchViewModel extends BaseViewModel {
  init(BuildContext context) {
    appContext = context;
  }

  TextEditingController foodNameController = TextEditingController();
  bool _textFieldIsEmpty = false;
  bool get textFieldIsEmpty => _textFieldIsEmpty;
  set textFieldIsEmpty(bool value) {
    _textFieldIsEmpty = value;
    notifyListeners();
  }

  void foodNameOnChanged(String? str) {
    if (str!.isEmpty) {
      textFieldIsEmpty = false;
    } else if (str.length > 3) {
      textFieldIsEmpty = true;
    }
  }
}
