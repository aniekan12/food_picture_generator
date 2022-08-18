import 'package:flutter/material.dart';
import 'package:food_picture_generator/navigation/app_state_manager.dart';
import 'package:food_picture_generator/ui/base/base_view_model.dart';
import 'package:provider/provider.dart';

class SplashViewModel extends BaseViewModel {
  late AppStateManager appStateManager;
  init(BuildContext context) {
    appContext = context;
    appStateManager = Provider.of<AppStateManager>(context, listen: false);
  }

  moveToSearchScreen() {
    appStateManager.isFoodSearchInitialised = true;
  }
}
