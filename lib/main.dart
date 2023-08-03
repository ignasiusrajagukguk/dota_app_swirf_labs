import 'package:dota_app_swirf_labs_test_case/common/router/router.dart';
import 'package:dota_app_swirf_labs_test_case/common/router/routes.dart';
import 'package:dota_app_swirf_labs_test_case/common/theme/theme.dart';
import 'package:dota_app_swirf_labs_test_case/provider/heroes_list_provider.dart';
import 'package:dota_app_swirf_labs_test_case/view/effect/scrolls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HeroesListProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateTitle: (BuildContext context) => 'Food App',
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Themes.mainTheme,
        initialRoute: Routes.splash,
        onGenerateRoute: (settings) => AppRouter.generateRoute(
          settings,
          const BouncingScrollBehavior(),
        ),
      ),
    );
  }
}
