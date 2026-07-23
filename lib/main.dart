import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/shared/services/local_notification_service.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await sl<LocalNotificationService>().init();
  await sl<LocalNotificationService>().requestPermissions();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AuthBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}
