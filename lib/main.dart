import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/features/auth/presentation/controllers/auth_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: const MainApp(),
    ),
  );
}
