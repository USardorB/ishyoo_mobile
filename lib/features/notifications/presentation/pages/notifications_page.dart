import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/notifications/presentation/widgets/notification_item.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildirishnomalar"),
      ),
      body: ListView.separated(
        padding: .all(16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return NotificationItem(
            read: index != 0,
            imageUrl: 'https://picsum.photos/400/200',
            date: '21-Apr, 16:40',
            title: 'Lorem ipsum dolor sit amet',
            body:
                "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit",
            onTap: () => context.pushRoute(
              NotificationDetailsRoute(
                id: '1',
                title: 'Lorem ipsum dolor sit amet',
              ),
            ),
          );
        },
        separatorBuilder: (_, _) => SizedBox(height: 16),
      ),
    );
  }
}
