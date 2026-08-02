import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';
import 'package:mobile/features/messaging/presentation/widgets/attatchment_options_sheet.dart';

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

    final isEmployer =
        context.read<AuthBloc>().state.userRole == UserRole.employer;

    context.read<MessagingBloc>().add(
      SendMessage(
        id: widget.chatId,
        content: text,
        isEmployer: isEmployer,
      ),
    );
    _controller.clear();
  }

  Future<void> _pickAndUpload(AttatchmentOptionsSheetType type) async {
    final isEmployer =
        context.read<AuthBloc>().state.userRole == UserRole.employer;
    final messagingBloc = context.read<MessagingBloc>();
    File? selectedFile;

    try {
      switch (type) {
        case AttatchmentOptionsSheetType.file:
          final result = await FilePicker.pickFiles();
          if (result != null && result.files.single.path != null) {
            selectedFile = File(result.files.single.path!);
          }
          break;
        case AttatchmentOptionsSheetType.gallery:
          final result = await ImagePicker().pickImage(
            source: ImageSource.gallery,
            maxHeight: 1080,
            maxWidth: 1080,
            imageQuality: 80,
          );
          if (result != null) {
            selectedFile = File(result.path);
          }
          break;
        case AttatchmentOptionsSheetType.camera:
          final result = await ImagePicker().pickImage(
            source: ImageSource.camera,
            maxHeight: 1080,
            maxWidth: 1080,
            imageQuality: 80,
          );
          if (result != null) {
            selectedFile = File(result.path);
          }
          break;
      }

      if (selectedFile != null && mounted) {
        messagingBloc.add(
          UploadChatFile(
            chatId: widget.chatId,
            file: selectedFile,
            isEmployer: isEmployer,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        AppNotificationOverlay.instance.show(
          message: 'messaging.errors.occurred'.tr(),
          type: AppNotificationType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton.filled(
            onPressed: () async {
              final type =
                  await showModalBottomSheet<AttatchmentOptionsSheetType>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const AttatchmentOptionsSheet(),
                  );
              if (type != null && mounted) {
                await _pickAndUpload(type);
              }
            },
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgPrimary,
              foregroundColor: context.colors.brightImmutable,
            ),
            icon: const Icon(Icons.add),
            color: context.colors.brandDefault,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: "messaging.input.placeholder".tr(),
                fillColor: context.colors.bgPrimary,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgPrimary,
              foregroundColor: context.colors.textSecondary,
            ),
            onPressed: _sendMessage,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
