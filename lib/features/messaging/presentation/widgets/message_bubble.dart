import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/consts/api_endpoints.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/services/token_service.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/messaging/data/models/chat_file.dart';
import 'package:mobile/features/messaging/data/models/message.dart';
import 'package:mobile/features/messaging/presentation/bloc/messaging_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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

  String _getFileUrl(BuildContext context, ChatFile file) {
    if (file.id == null) return '';
    final isEmployer =
        context.read<AuthBloc>().state.userRole == UserRole.employer;
    final rolePath = isEmployer ? 'employer' : 'candidate';
    return '${ApiEndpoints.baseUrl}/mobile/$rolePath/chat/$chatId/file/${file.id}';
  }

  void _openUrl(BuildContext context, ChatFile file) async {
    final url = _getFileUrl(context, file);
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    final token = sl<TokenService>().getAccessToken();
    final headers = token != null
        ? {'Authorization': 'Bearer $token'}
        : const <String, String>{};

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: WebViewConfiguration(headers: headers),
      );
    }
  }

  bool isSingleGrapheme(String text) => text.trim().characters.length == 1;

  void _showImageFullScreen(
    BuildContext context,
    String imageUrl,
    Map<String, String>? headers,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 1.0,
            maxScale: 4.0,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              httpHeaders: headers,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.broken_image,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final token = sl<TokenService>().getAccessToken();
    final headers = token != null
        ? {'Authorization': 'Bearer $token'}
        : const <String, String>{};

    if (isSingleGrapheme(message.content ?? "")) {
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
              color:
                  (isMine
                          ? context.colors.brandProgress
                          : context.colors.bgPrimary)
                      .withAlpha(60),
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              message.content!,
              style: TextStyle(
                color: isMine ? Colors.white : context.colors.textPrimary,
                fontSize: 72,
                height: 1.2,
              ),
            ),
          ),
        ),
      );
    }

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
              if (message.files != null && message.files!.isNotEmpty) ...[
                for (final file in message.files!)
                  if (file.mimeType?.startsWith('image/') == true)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: GestureDetector(
                        onTap: () => _showImageFullScreen(
                          context,
                          _getFileUrl(context, file),
                          headers,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 300),
                            child: CachedNetworkImage(
                              imageUrl: _getFileUrl(context, file),
                              httpHeaders: headers,
                              placeholder: (context, url) => Container(
                                height: 150,
                                width: 150,
                                color: context.colors.bgSecondary,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 150,
                                width: 150,
                                color: context.colors.bgSecondary,
                                child: const Icon(Icons.broken_image),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: () => _openUrl(context, file),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.insert_drive_file,
                              color: context.colors.textPrimary,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                file.originalName ?? 'Fayl',
                                style: context.textThemes.b3.copyWith(
                                  color: context.colors.textPrimary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ],
              if (message.content != null && message.content!.isNotEmpty)
                Text(
                  message.content!,
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
              title: const Text("messaging.actions.edit").tr(),
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
                "messaging.actions.delete".tr(),
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
        title: const Text("messaging.dialogs.editMessage.title").tr(),
        content: AppInputField(
          controller: ctrl,
          autofocus: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          hintText: "messaging.input.placeholder".tr(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("messaging.actions.cancel").tr(),
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
            child: const Text("messaging.actions.save").tr(),
          ),
        ],
      ),
    );
  }
}
