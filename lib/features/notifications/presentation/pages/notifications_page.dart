import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/notifications/presentation/widgets/notification_item.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import '../bloc/notifications_bloc.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final role = context.read<AuthBloc>().state.userRole;
    final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';

    return BlocProvider(
      create: (context) => sl<NotificationsBloc>()..add(LoadNotifications(roleString)),
      child: _NotificationsPageView(roleString: roleString),
    );
  }
}

class _NotificationsPageView extends StatelessWidget {
  final String roleString;

  const _NotificationsPageView({required this.roleString});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirishnomalar"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NotificationsBloc>().add(MarkAllAsRead(roleString));
            },
            icon: const Icon(Icons.checklist),
            tooltip: "Barchasini o'qilgan deb belgilash",
          ),
        ],
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          if (state.isLoading && state.notifications == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.notifications == null) {
            return Center(child: Text(state.error!));
          }

          final notifications = state.notifications ?? [];

          if (notifications.isEmpty) {
            return const Center(child: Text("Hozircha ma'lumot yo'q"));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationItem(
                read: notification.isRead,
                date: notification.createdAt != null
                    ? DateFormat('dd-MMM, HH:mm').format(notification.createdAt!)
                    : "",
                title: notification.title,
                body: notification.message,
                onTap: () => context.pushRoute(
                  NotificationDetailsRoute(
                    id: notification.id.toString(),
                    title: notification.title,
                  ),
                ),
              );
            },
            separatorBuilder: (_, _) => const SizedBox(height: 16),
          );
        },
      ),
    );
  }
}

