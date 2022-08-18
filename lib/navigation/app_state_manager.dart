import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialised = false;
  bool get isInitialised => _initialised;
  set isInitialised(bool value) {
    _initialised = value;
    notifyListeners();
  }

  bool _foodSearchInitialised = false;
  bool get isFoodSearchInitialised => _foodSearchInitialised;
  set isFoodSearchInitialised(bool value) {
    _foodSearchInitialised = value;
    notifyListeners();
  }

  void initializeApp() {
    _initialised = true;
    notifyListeners();
  }

  void closeApp() {
    _initialised = false;
    _foodSearchInitialised = false;
    SystemNavigator.pop();
    notifyListeners();
  }
}
