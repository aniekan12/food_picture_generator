import 'package:flutter/cupertino.dart';
import 'package:food_picture_generator/screens.dart';
import 'package:food_picture_generator/ui/views/splash/view.dart';

import 'app_state_manager.dart';
import 'pages.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  late final GlobalKey<NavigatorState> navigatorKey;

  late final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialised) SplashView.page(),
        if (appStateManager.isInitialised) SplashView.page(),
        if (appStateManager.isFoodSearchInitialised) FoodSearch.page(),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == AppPages.foodSearchPath) {
      appStateManager.isFoodSearchInitialised = false;
      appStateManager.isInitialised = true;
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    return;
  }
}
