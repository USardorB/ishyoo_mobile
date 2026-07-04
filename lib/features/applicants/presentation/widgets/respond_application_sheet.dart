import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class RespondApplicationSheet extends StatelessWidget {
  const RespondApplicationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bottom = Platform.isIOS ? 12.0 : MediaQuery.paddingOf(context).bottom;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ).copyWith(bottom: 16 + bottom),
      child: Column(
        crossAxisAlignment: .stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHandler(context),
          SizedBox(height: 4),
          Text(
            "Rad etish xati",
            style: context.textThemes.h5,
          ),
          SizedBox(height: 4),
          Text(
            "Aziz Karimov",
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: 18),
          _buildApplicationResponseOption(context),
          SizedBox(height: 12),
          _buildApplicationResponseOption(context),
          SizedBox(height: 12),
          _buildApplicationResponseOption(context),
          SizedBox(height: 16),
          Text(
            "XAT MATNI",
            style: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: .circular(14)),
              errorBorder: OutlineInputBorder(borderRadius: .circular(14)),
              enabledBorder: OutlineInputBorder(borderRadius: .circular(14)),
              hintText: 'Rezyumeni ko\'rib chiqishda bizda...',
              fillColor: context.colors.bgCard,
              filled: true,
            ),
            minLines: 4,
            maxLines: 6,
          ),
          SizedBox(height: 24),
          AppButton(
            onTap: () {},
            label: "Rad etish",
            color: context.colors.danger,
          ),
        ],
      ),
    );
  }

  Container _buildApplicationResponseOption(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: context.colors.bgCard,
        borderRadius: .circular(14),
        border: .all(color: context.colors.brandDefault),
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: .stretch,
              spacing: 6,
              children: [
                Text("Yumshoq rad", style: context.textThemes.s3),
                Text(
                  "Afsuski, sizning rezyumengiz mos kelmadi...",
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textThemes.c1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.radio_button_checked,
            color: context.colors.brandDefault,
          ),
        ],
      ),
    );
  }

  Widget _buildHandler(
    BuildContext context,
  ) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Align(
      child: Container(
        width: 60,
        height: 6,
        decoration: BoxDecoration(
          color: context.colors.bgTertiary.withValues(alpha: .75),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ),
  );
}
