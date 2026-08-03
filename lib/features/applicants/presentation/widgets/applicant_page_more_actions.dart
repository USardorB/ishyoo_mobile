import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ApplicantPageMoreActions extends StatelessWidget {
  const ApplicantPageMoreActions({super.key});

  @override
  Widget build(BuildContext context) {
    final bottom = Platform.isIOS ? 12.0 : MediaQuery.paddingOf(context).bottom;
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ).copyWith(bottom: 16 + bottom),
          sliver: SliverList.separated(
            itemCount: ApplicantPageActions.values.length + 1,
            itemBuilder: (_, index) {
              if (index == 0) return _buildHandler(context);
              final item = ApplicantPageActions.values.elementAt(index - 1);
              return _buildAction(
                context,
                icon: item.icon,
                title: "applicants.moreActions.${item.name}".tr(),
                foregroundColor: item == ApplicantPageActions.complaint
                    ? context.colors.danger
                    : null,
              );
            },
            separatorBuilder: _seperatorBuilder,
          ),
        ),
      ],
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

  Widget? _seperatorBuilder(BuildContext context, int index) {
    if (index == 0) return const SizedBox.shrink();
    return Divider(
      thickness: .5,
      color: context.colors.lineSecondary,
      height: 25,
    );
  }

  Widget _buildAction(
    BuildContext context, {
    required IconData icon,
    required String title,
    Color? foregroundColor,
  }) => SizedBox(
    height: 32,
    child: Row(
      spacing: 8,
      children: [
        Container(
          padding: const .all(4),
          decoration: BoxDecoration(
            color: context.colors.bgSecondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: foregroundColor ?? context.colors.textSecondary,
          ),
        ),
        Text(
          title,
          style: context.textThemes.buttonLarge.copyWith(
            color: foregroundColor,
          ),
        ),
      ],
    ),
  );
}

enum ApplicantPageActions {
  chat(icon: Icons.chat_rounded),
  invitation(icon: Icons.check_circle_outline_rounded),
  share(icon: Icons.share_rounded),
  decline(icon: Icons.not_interested_rounded),
  complaint(icon: Icons.warning_rounded);

  final IconData icon;

  const ApplicantPageActions({
    required this.icon,
  });
}
