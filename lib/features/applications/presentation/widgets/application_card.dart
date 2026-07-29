import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/applications/presentation/widgets/application_menu_sheet.dart';
import 'package:mobile/features/applications/presentation/widgets/reject_application_dialog.dart';

import '../../data/models/application.dart';

class ApplicationCard extends StatelessWidget {
  final Application application;
  final VoidCallback onRefuse;

  const ApplicationCard({
    super.key,
    required this.application,
    required this.onRefuse,
  });

  @override
  Widget build(BuildContext context) {
    Color statusBgColor;
    Color statusTextColor = Colors.white;

    String displayStatus;
    switch (application.status) {
      case 'rejected':
        displayStatus = "applications.status.rejected".tr();
        statusBgColor = context.colors.danger;
        break;
      case 'invited':
        displayStatus = "applications.status.interview".tr();
        statusBgColor = context.colors.success;
        break;
      case 'archived':
        displayStatus = "applications.status.archived".tr();
        statusBgColor = context.colors.textSecondary;
        break;
      case 'pending':
      default:
        displayStatus = "applications.status.pending".tr();
        statusBgColor = context.colors.bgTertiary;
        statusTextColor = context.colors.textPrimary;
        break;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () =>
          context.pushRoute(VacancyDetailsRoute(id: application.vacancyId!)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  application.vacancy?.organization?.name ?? "",
                  style: context.textThemes.c2.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    displayStatus,
                    style: context.textThemes.c2.copyWith(
                      color: statusTextColor,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => ApplicationMenuSheet(
                      onRefuse: onRefuse,
                      application: application,
                    ),
                  ),
                  icon: const Icon(Icons.more_vert, size: 24),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              application.vacancy?.jobTitle ?? "",
              style: context.textThemes.s1,
            ),
            const SizedBox(height: 12),
            Text(
              "${application.vacancy?.location?.split(',').first ?? ''} • ${application.vacancy?.jobType?.replaceAll('_', ' ') ?? ''}",
              style: context.textThemes.b1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 20,
                  color: context.colors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  application.createdAt != null
                      ? "${application.createdAt!.day}.${application.createdAt!.month}.${application.createdAt!.year}"
                      : "",
                  style: context.textThemes.b2.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
            Divider(
              color: context.colors.lineSecondary,
              height: 25,
              thickness: .5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        application.vacancy?.salaryFrom != null
                            ? "${application.vacancy!.salaryFrom} ${application.vacancy!.currency ?? 'UZS'}"
                            : "shared.negotiable".tr(),
                        style: context.textThemes.s2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: AppButton(
                      onTap: () => context.pushRoute(
                        ChatDetailsRoute(chatId: "application.chatId"),
                      ),
                      label: "nav.chats".tr(),
                      color: context.colors.brandProgress,
                      foregroundColor: context.colors.brandDefault,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: AppButton(
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) => RejectApplicationDialog(
                          onConfirm: onRefuse,
                        ),
                      ),
                      label: "applications.tabs.rejected".tr(),
                      color: context.colors.bgTertiary,
                      foregroundColor: context.colors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
