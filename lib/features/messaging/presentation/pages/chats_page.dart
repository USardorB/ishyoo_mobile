import 'package:auto_route/auto_route.dart';
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
              hintText: "Search chats...",
              prefixIcon: IconButton(
                onPressed: null,
                icon: const Icon(Icons.search),
              ),
            ),
            // bottom: ChatTypeFilterTab(),
          ),
          body: BlocBuilder<MessagingBloc, MessagingState>(
            builder: (context, state) {
              if (state.isLoadingChats) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.error != null) {
                return Center(child: Text(state.error!));
              } else if (state.chats == null || state.chats!.isEmpty) {
                return const NoApplicationPlaceholder(
                  message:
                      "Hozircha suhbatlar yo‘q. Suhbatlar bu yerda paydo bo‘ladi.",
                );
              }

              return TabBarView(
                children: [
                  ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 20,
                        ).copyWith(
                          bottom: MediaQuery.paddingOf(context).bottom + 16,
                        ),
                    itemCount: state.chats!.length,
                    itemBuilder: (context, index) {
                      final chat = state.chats![index];

                      // Logic to extract partner details
                      String title = "Noma'lum";
                      String image = "https://i.pravatar.cc/100?u=${chat.id}";

                      if (isEmployer) {
                        title =
                            chat.partner?.name ??
                            chat.application?.resume?.profile?.name ??
                            chat.application?.resume?.user?.name ??
                            title;
                      } else {
                        title =
                            chat.application?.vacancy?.organization?.name ??
                            title;
                        image =
                            chat.application?.vacancy?.organization?.logoUrl ??
                            image;
                      }

                      final lastMessage =
                          chat.messages != null && chat.messages!.isNotEmpty
                          ? (chat.messages!.first.content ?? 'Fayl yuborildi')
                          : "Suhbat boshlandi";

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
                  ),
                  const Placeholder(),
                  const Placeholder(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
