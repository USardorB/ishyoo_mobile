import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/themes/app_colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

@RoutePage()
class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          context.router.replace(const ChooseLanguageRoute());
        }
      });
      return null;
    }, []);

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
