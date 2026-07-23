import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:mobile/core/themes/app_theme_data.dart';

final appRouter = AppRouter();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "IshYoo Mobile",
      theme: AppThemeData.light,
      darkTheme: AppThemeData.dark,
      themeMode: .dark,
      routerConfig: appRouter.config(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
            boldText: false,
            alwaysUse24HourFormat: true,
            highContrast: false,
          ),
          child: child!,
        );
      },
    );
  }
}
