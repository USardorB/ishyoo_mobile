import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applications/presentation/widgets/no_application_placeholder.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_item.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';

@RoutePage()
class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmployer =
        context.read<AuthBloc>().state.userRole == UserRole.employer;

    return BlocProvider(
      create: (context) =>
          sl<MessagingBloc>()..add(LoadChats(isEmployer: isEmployer)),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: DarkGlassSearchField(
              hintText: "messaging.search.placeholder".tr(),
              prefixIcon: const IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
              ),
            ),
          ),
          body: BlocBuilder<MessagingBloc, MessagingState>(
            builder: (context, state) {
              if (state.isLoadingChats) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.error != null) {
                return Center(child: Text(state.error!));
              } else if (state.chats == null || state.chats!.isEmpty) {
                return NoApplicationPlaceholder(
                  message: "messaging.emptyState".tr(),
                );
              }

              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(
                      bottom: MediaQuery.paddingOf(context).bottom + 16,
                    ),
                itemCount: state.chats!.length,
                itemBuilder: (context, index) {
                  final chat = state.chats![index];

                  String title = "Noma'lum";
                  String image = chat.partner?.avatar ?? '';

                  if (isEmployer) {
                    title =
                        chat.partner?.name ??
                        chat.application?.resume?.profile?.name ??
                        chat.application?.resume?.user?.name ??
                        title;
                  } else {
                    title =
                        chat.application?.vacancy?.organization?.name ?? title;
                  }

                  final lastMessage =
                      chat.messages != null && chat.messages!.isNotEmpty
                      ? (chat.messages!.first.content ??
                            'messaging.attachment.label'.tr())
                      : "messaging.title".tr();

                  return ChatItem(
                    chatId: chat.id,
                    image: image,
                    lastMessage: lastMessage,
                    title: title,
                    time: chat.createdAt != null
                        ? '${chat.createdAt!.hour}:${chat.createdAt!.minute.toString().padLeft(2, '0')}'
                        : '',
                    unreadCount: chat.count?.messages ?? 0,
                    isOnline: false,
                  );
                },
                separatorBuilder: (_, _) => Divider(
                  indent: 64,
                  color: context.colors.lineSecondary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
