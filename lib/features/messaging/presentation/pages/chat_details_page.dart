import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_actions_sheet.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_details_page_job_card.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_page_bottom_part.dart';
import 'package:mobile/features/messaging/presentation/widgets/message_bubble.dart';

@RoutePage()
class ChatDetailsPage extends StatelessWidget {
  const ChatDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              'https://i.pravatar.cc/200',
            ),
          ),
          horizontalTitleGap: 12,
          subtitleTextStyle: context.textThemes.c1.copyWith(
            color: context.colors.success,
          ),
          titleTextStyle: context.textThemes.s3,
          title: Text('Aziz Karimov'),
          subtitle: Text('Online'),
        ),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (_) => ChatActionsSheet(),
            ),
            icon: Icon(Icons.more_vert),
          ),
        ],
        bottom: ChatDetailsPageJobCard(),
      ),
      body: ListView.builder(
        padding: .only(
          top: MediaQuery.paddingOf(context).top + kToolbarHeight + 8,
          bottom: MediaQuery.paddingOf(context).bottom + kToolbarHeight,
        ),
        reverse: true,
        itemBuilder: (_, index) => MessageBubble(
          isMine: Random().nextBool(),
        ),
      ),
      floatingActionButtonLocation: .centerDocked,
      floatingActionButton: ChatPageBottomPart(),
    );
  }
}
