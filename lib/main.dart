import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/shared/services/local_notification_service.dart';
import 'package:mobile/core/themes/theme_cubit.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  await sl<LocalNotificationService>().init();
  await sl<LocalNotificationService>().requestPermissions();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('uz', 'LAT'),
        Locale('uz', 'KR'),
        Locale('ru'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('uz', 'LAT'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<AuthBloc>()),
          BlocProvider(create: (_) => sl<ThemeCubit>()),
        ],
        child: const MainApp(),
      ),
    ),
  );
}
