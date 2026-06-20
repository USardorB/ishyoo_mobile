import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/themes/app_colors.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLightColors.brandDefault,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: SvgPicture.asset(AppAssets.logo),
          ),
        ],
      ),
    );
  }
}
