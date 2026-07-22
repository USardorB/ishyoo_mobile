import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/messaging/presentation/widgets/attatchment_options_sheet.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';

// TODO(Sardor) Rename for better readability
class ChatPageBottomPart extends StatefulWidget {
  final String chatId;
  const ChatPageBottomPart({super.key, required this.chatId});

  @override
  State<ChatPageBottomPart> createState() => _ChatPageBottomPartState();
}

class _ChatPageBottomPartState extends State<ChatPageBottomPart> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final isEmployer = context.read<AuthBloc>().state.userRole == UserRole.employer;
    
    context.read<MessagingBloc>().add(
      SendMessage(
        id: widget.chatId,
        content: text,
        isEmployer: isEmployer,
      ),
    );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          IconButton.filled(
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => AttatchmentOptionsSheet(chatId: widget.chatId),
            ),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgPrimary,
              foregroundColor: context.colors.brightImmutable,
            ),
            icon: Icon(Icons.add),
            color: context.colors.brandDefault,
          ),
          Flexible(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: "Xabar yozing...",
                fillColor: context.colors.bgPrimary,
                filled: true,
                contentPadding: .symmetric(horizontal: 16, vertical: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgPrimary,
              foregroundColor: context.colors.textSecondary,
            ),
            onPressed: _sendMessage,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
