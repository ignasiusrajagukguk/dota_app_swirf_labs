import 'package:dota_app_swirf_labs_test_case/common/router/routes.dart';
import 'package:dota_app_swirf_labs_test_case/view/detail_hero/detail_hero.dart';
import 'package:dota_app_swirf_labs_test_case/view/screen/home/home.dart';
import 'package:dota_app_swirf_labs_test_case/view/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(
      RouteSettings routeSettings, ScrollBehavior scrollBehavior) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        return ScrollConfiguration(
          behavior: scrollBehavior,
          child: _getScreen(
            settings: routeSettings,
          ),
        );
      },
    );
  }

  static Widget _getScreen({required RouteSettings settings}) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return const Splash();
      case Routes.home:
        return const Home();
      case Routes.detailHeroes:
        HeroDetailArgument? argument;
        if (args is HeroDetailArgument) argument = args;
        return HeroDetail(argument: argument!);
      default:
        return Container();
    }
  }
}
