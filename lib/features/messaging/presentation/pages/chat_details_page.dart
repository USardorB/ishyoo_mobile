

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_actions_sheet.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_details_page_job_card.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_page_bottom_part.dart';
import 'package:mobile/features/messaging/presentation/widgets/message_bubble.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';

@RoutePage()
class ChatDetailsPage extends StatelessWidget {
  final String chatId;
  const ChatDetailsPage({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    final isEmployer = context.read<AuthBloc>().state.userRole == UserRole.employer;
    final userId = context.read<AuthBloc>().state.user?.id; // Assuming user.id exists, otherwise we'll gracefully fallback

    return BlocProvider(
      create: (context) => sl<MessagingBloc>()..add(LoadChatDetail(id: chatId, isEmployer: isEmployer)),
      child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: BlocBuilder<MessagingBloc, MessagingState>(
          builder: (context, state) {
            final partner = state.currentChat?.partner;
            final name = partner?.name ?? 'Yuklanmoqda...';
            final avatarUrl = partner?.avatar ?? 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(name)}';
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(avatarUrl),
              ),
              horizontalTitleGap: 12,
              subtitleTextStyle: context.textThemes.c1.copyWith(
                color: context.colors.success,
              ),
              titleTextStyle: context.textThemes.s3,
              title: Text(name),
              subtitle: partner?.specialization != null
                  ? Text(partner!.specialization!)
                  : null,
            );
          },
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 10),
          child: BlocBuilder<MessagingBloc, MessagingState>(
            builder: (context, state) {
              String title = "Vakansiya / Rezyume";
              if (state.currentChat != null) {
                final chat = state.currentChat!;
                if (isEmployer) {
                  title = chat.partner?.name ?? chat.application?['resume']?['specialization'] ?? title;
                } else {
                  title = chat.application?['vacancy']?['organization']?['name'] ?? title;
                }
              }
              return ChatDetailsPageJobCard(title: title);
            },
          ),
        ),
      ),
      body: BlocBuilder<MessagingBloc, MessagingState>(
        builder: (context, state) {
          if (state.isLoadingChatDetail) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text(state.error!));
          } else if (state.currentChat == null || state.currentChat!.messages == null || state.currentChat!.messages!.isEmpty) {
            return const Center(child: Text("Xabarlar yo'q"));
          }

          final messages = state.currentChat!.messages!;
          
          return ListView.builder(
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top + kToolbarHeight + 8,
              bottom: MediaQuery.paddingOf(context).bottom + kToolbarHeight,
            ),
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (_, index) {
              final message = messages[index];
              // Use senderId to check if message is mine
              final isMine = message.senderId == userId;
              
              return MessageBubble(
                isMine: isMine,
                message: message,
                chatId: chatId,
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ChatPageBottomPart(chatId: chatId),
    ));
  }
}
