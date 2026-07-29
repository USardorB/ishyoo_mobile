import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routes/app_router.dart';
import 'package:mobile/core/themes/app_theme_data.dart';
import 'package:mobile/core/themes/theme_cubit.dart';

final appRouter = AppRouter();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: "IshYoo Mobile",
          theme: AppThemeData.light,
          darkTheme: AppThemeData.dark,
          themeMode: themeMode,
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
      },
    );
  }
}
