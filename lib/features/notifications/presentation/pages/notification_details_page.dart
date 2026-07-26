import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

import '../bloc/notification_detail_bloc.dart';

@RoutePage()
class NotificationDetailsPage extends StatelessWidget {
  final String id;
  final String title;

  const NotificationDetailsPage({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final role = context.read<AuthBloc>().state.userRole;
    final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';

    return BlocProvider(
      create: (context) =>
          sl<NotificationDetailBloc>()
            ..add(LoadNotificationDetail(roleString, id)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<NotificationDetailBloc, NotificationDetailState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text(state.error!));
            }

            if (state.notification == null) {
              return const Center(child: Text("Ma'lumot topilmadi"));
            }

            final notification = state.notification!;

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  notification.message,
                  style: context.textThemes.s2,
                ),
                const SizedBox(height: 8),
                Text(
                  notification.createdAt != null
                      ? DateFormat(
                          'dd-MMM, HH:mm',
                        ).format(notification.createdAt!)
                      : "",
                  style: context.textThemes.b2.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 18),
              ],
            );
          },
        ),
      ),
    );
  }
}
