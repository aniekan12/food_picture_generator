import 'package:flutter/material.dart';
import 'package:food_picture_generator/navigation/pages.dart';
import 'package:food_picture_generator/ui/base/base_view.dart';
import 'package:food_picture_generator/ui/widgets/app_button.dart';
import 'package:food_picture_generator/utils/app_theme.dart';
import 'package:lottie/lottie.dart';

import 'view_model.dart';

class SplashView extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: AppPages.splashPath,
        key: ValueKey(AppPages.splashPath),
        child: const SplashView());
  }

  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      model: SplashViewModel(),
      onModelReady: (model) => model.init(context),
      onDispose: (model) => model.dispose(),
      builder: (context, model, _) {
        return Scaffold(
          backgroundColor: AppTheme.darkTheme().backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json'),
              const SizedBox(height: 20),
              Text('search for food pictures just because you can',
                  style: AppTheme.darkTheme().textTheme.bodyText1),
              const SizedBox(height: 50),
              AppButton(
                  onTap: model.moveToSearchScreen,
                  buttonText: 'Continue',
                  isPrimary: true,
                  isActive: true),
            ],
          ),
        );
      },
    );
  }
}
