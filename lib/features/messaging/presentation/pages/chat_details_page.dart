import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_details_page_job_card.dart';
import 'package:mobile/features/messaging/presentation/widgets/chat_page_bottom_part.dart';
import 'package:mobile/features/messaging/presentation/widgets/message_bubble.dart';

@RoutePage()
class ChatDetailsPage extends StatelessWidget {
  final String chatId;
  const ChatDetailsPage({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    final isEmployer =
        context.read<AuthBloc>().state.userRole == UserRole.employer;
    final userId = context.read<AuthBloc>().state.user?.id;

    return BlocProvider(
      create: (_) => sl<MessagingBloc>()
        ..add(LoadChatDetail(id: chatId, isEmployer: isEmployer))
        ..add(StartChatPolling(id: chatId, isEmployer: isEmployer)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: BlocBuilder<MessagingBloc, MessagingState>(
            builder: (context, state) {
              final partner = state.currentChat?.partner;
              final name = partner?.name ?? 'shared.loading'.tr();
              final avatarUrl = partner?.avatar;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: avatarUrl != null
                      ? CachedNetworkImageProvider(avatarUrl)
                      : null,
                  backgroundColor: context.colors.bgSecondary,
                  child: avatarUrl == null
                      ? Icon(Icons.person, color: context.colors.textSecondary)
                      : null,
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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 10),
            child: BlocBuilder<MessagingBloc, MessagingState>(
              builder: (context, state) {
                String title = "nav.vacancies".tr();
                if (state.currentChat != null) {
                  final chat = state.currentChat!;
                  if (isEmployer) {
                    title =
                        chat.partner?.name ??
                        chat.application?.resume?.specialization ??
                        title;
                  } else {
                    title =
                        chat.application?.vacancy?.organization?.name ?? title;
                  }
                }
                return ChatDetailsPageJobCard(
                  onTap: () {
                    final resumeId = state.currentChat?.application?.resume?.id;
                    final vacancyId =
                        state.currentChat?.application?.vacancy?.id;

                    if ((resumeId ?? vacancyId) == null) {
                      AppNotificationOverlay.instance.show(
                        message: "shared.no_data".tr(),
                        type: AppNotificationType.warning,
                      );
                      return;
                    }
                    if (isEmployer) {
                      context.replaceRoute(
                        ApplicantDetailsRoute(
                          vacancyId: vacancyId!,
                          applicantResumeId: resumeId!,
                        ),
                      );
                    } else {
                      context.replaceRoute(VacancyDetailsRoute(id: vacancyId!));
                    }
                  },
                  title: isEmployer
                      ? state
                                .currentChat
                                ?.application
                                ?.resume
                                ?.specialization ??
                            ""
                      : state
                                .currentChat
                                ?.application
                                ?.vacancy
                                ?.organization
                                ?.name ??
                            "",
                  isEmployer: isEmployer,
                );
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
            } else if (state.currentChat == null ||
                state.currentChat!.messages == null ||
                state.currentChat!.messages!.isEmpty) {
              return Center(child: const Text("messaging.no_chats").tr());
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
      ),
    );
  }
}
