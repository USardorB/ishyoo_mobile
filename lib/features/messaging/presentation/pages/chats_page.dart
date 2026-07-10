import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_item.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_type_filter_tab.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';

@RoutePage()
class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: DarkGlassSearchField(
            hintText: "Search chats...",
            prefixIcon: IconButton(
              onPressed: null,
              icon: const Icon(Icons.search),
            ),
          ),
          bottom: ChatTypeFilterTab(),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(bottom: MediaQuery.paddingOf(context).bottom + 16),

              itemBuilder: (context, index) {
                return ChatItem(
                  image: "https://i.pravatar.cc/${Random().nextInt(100)}",
                  lastMessage: 'Sure! I’ll get back to you ASAP.',
                  title: 'John Doe',
                  time: '12:45 PM',
                  unreadCount: Random().nextInt(10),
                  isOnline: Random().nextBool(),
                );
              },
              itemCount: 10,
              separatorBuilder: (_, _) => Divider(
                indent: 64,
                color: context.colors.lineSecondary,
              ),
            ),
            Placeholder(),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
