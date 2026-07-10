import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.isMine,
  });

  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        decoration: BoxDecoration(
          borderRadius: .circular(14),
          color: isMine
              ? context.colors.brandDefault
              : context.colors.bgPrimary,
        ),
        padding: .all(8),
        margin: .symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              'Salom! Rahmat taklifingiz uchun. Qachon va qayerda uchrashish mumkin?',
              style: context.textThemes.b2.copyWith(
                color: isMine
                    ? context.colors.midnightImmutable
                    : context.colors.textPrimary,
              ),
            ),
            Row(
              mainAxisAlignment: .end,
              spacing: 5,
              children: [
                Text(
                  "18:12",
                  style: context.textThemes.c1.copyWith(
                    color: isMine
                        ? context.colors.midnightImmutable
                        : context.colors.textPrimary,
                  ),
                ),
                if (isMine)
                  Icon(
                    Icons.done,
                    color: isMine
                        ? context.colors.midnightImmutable
                        : context.colors.textPrimary,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
