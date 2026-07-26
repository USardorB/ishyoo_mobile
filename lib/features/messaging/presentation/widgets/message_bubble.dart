import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/data/models/message.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.isMine,
    required this.message,
    required this.chatId,
  });

  final bool isMine;
  final Message message;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: isMine ? () => _showActions(context) : null,
      child: Align(
        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isMine
                ? context.colors.brandDefault
                : context.colors.bgPrimary,
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.content ??
                    (message.files?.isNotEmpty == true ? 'Fayl yuborildi' : ''),
                style: context.textThemes.b2.copyWith(
                  color: isMine
                      ? context.colors.midnightImmutable
                      : context.colors.textPrimary,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message.sendedAt != null
                        ? '${message.sendedAt!.hour}:${message.sendedAt!.minute.toString().padLeft(2, '0')}'
                        : '',
                    style: context.textThemes.c1.copyWith(
                      color: isMine
                          ? context.colors.midnightImmutable
                          : context.colors.textPrimary,
                    ),
                  ),
                  if (isMine) ...[
                    const SizedBox(width: 4),
                    Icon(
                      Icons.done,
                      size: 14,
                      color: isMine
                          ? context.colors.midnightImmutable
                          : context.colors.textPrimary,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showActions(BuildContext context) {
    final isEmployer =
        context.read<AuthBloc>().state.userRole == UserRole.employer;

    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text("Tahrirlash"),
              onTap: () {
                Navigator.pop(ctx);
                _showEditDialog(context, isEmployer);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_outline,
                color: context.colors.danger,
              ),
              title: Text(
                "O'chirish",
                style: TextStyle(color: context.colors.danger),
              ),
              onTap: () {
                Navigator.pop(ctx);
                context.read<MessagingBloc>().add(
                  DeleteMessage(
                    chatId: chatId,
                    messageId: message.id,
                    isEmployer: isEmployer,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, bool isEmployer) {
    final ctrl = TextEditingController(text: message.content ?? '');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Xabarni tahrirlash"),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          maxLines: null,
          decoration: const InputDecoration(hintText: "Yangi matn..."),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Bekor"),
          ),
          TextButton(
            onPressed: () {
              final newText = ctrl.text.trim();
              if (newText.isNotEmpty) {
                context.read<MessagingBloc>().add(
                  EditMessage(
                    chatId: chatId,
                    messageId: message.id,
                    newContent: newText,
                    isEmployer: isEmployer,
                  ),
                );
              }
              Navigator.pop(ctx);
            },
            child: const Text("Saqlash"),
          ),
        ],
      ),
    );
  }
}
