import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'core/providers/setup.dart';
import 'navigation/app_router.dart';
import 'navigation/app_state_manager.dart';
import 'utils/app_theme.dart';

class FoodPictureGenerator extends StatefulWidget {
  final bool isDebug;
  const FoodPictureGenerator({Key? key, this.isDebug = true}) : super(key: key);

  @override
  State<FoodPictureGenerator> createState() => _FoodPictureGeneratorAppState();
}

class _FoodPictureGeneratorAppState extends State<FoodPictureGenerator> {
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
  }

  late GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ...providers,
      ],
      child: OKToast(
        child: MaterialApp(
          debugShowCheckedModeBanner: widget.isDebug,
          darkTheme: AppTheme.darkTheme(),
          theme: AppTheme.lightTheme(),
          home: Router(
            routerDelegate: _appRouter,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ),
      ),
    );
  }
}
