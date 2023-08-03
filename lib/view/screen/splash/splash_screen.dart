import 'package:dota_app_swirf_labs_test_case/common/colors.dart';
import 'package:dota_app_swirf_labs_test_case/common/constants/assets_image.dart';
import 'package:dota_app_swirf_labs_test_case/common/router/routes.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home,
              (route) => false,
            ));
    return Scaffold(
      backgroundColor: ConstColors.dark50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(assetsDotaIcon, height: 120),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
