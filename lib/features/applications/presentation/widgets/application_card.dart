import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/applications/presentation/widgets/application_menu_sheet.dart';
import 'package:mobile/features/applications/presentation/widgets/reject_application_dialog.dart';

import '../../data/models/application.dart';
import 'package:intl/intl.dart';

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
        displayStatus = "Rad etildi";
        statusBgColor = context.colors.danger;
        break;
      case 'invited':
        displayStatus = "Suhbatga chaqirildi";
        statusBgColor = context.colors.success;
        break;
      case 'archived':
        displayStatus = "Arxivlandi";
        statusBgColor = context.colors.textSecondary;
        break;
      case 'pending':
      default:
        displayStatus = "Kutilmoqda";
        statusBgColor = context.colors.bgTertiary;
        statusTextColor = context.colors.textPrimary;
        break;
    }

    return Container(
      padding: const .all(12),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(16),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(
                application.vacancy?.organization?.name ?? "Kompaniya",
                style: context.textThemes.c2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const .symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: .circular(8),
                ),
                child: Text(
                  displayStatus,
                  style: context.textThemes.c2.copyWith(color: statusTextColor),
                ),
              ),
              const Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  padding: .zero,
                  visualDensity: .compact,
                  tapTargetSize: .shrinkWrap,
                ),
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => ApplicationMenuSheet(
                    onRefuse: onRefuse,
                  ),
                ),
                icon: Icon(Icons.more_vert, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            application.vacancy?.jobTitle ?? "Vakansiya",
            style: context.textThemes.s1,
          ),
          const SizedBox(height: 12),
          Text(
            "${application.vacancy?.location?.split(',').first ?? 'Manzil'} • ${application.vacancy?.jobType?.replaceAll('_', ' ') ?? ''}",
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
                    ? DateFormat('MMM dd, yyyy').format(application.createdAt!)
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
            crossAxisAlignment: .end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(
                      application.vacancy?.salaryFrom != null 
                        ? "${application.vacancy!.salaryFrom} ${application.vacancy!.currency ?? 'so\'m'}"
                        : "Kelishilgan",
                      style: context.textThemes.s2,
                    ),
                    if (application.vacancy?.salaryFrom != null)
                      Text(
                        "oyiga",
                        style: context.textThemes.c2.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                "",
                style: context.textThemes.b1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: AppButton(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Chat tez orada qo'shiladi")),
                      );
                    },
                    label: "Chatga yozish",
                    color: context.colors.brandProgress,
                    foregroundColor: context.colors.brandDefault,
                  ),
                ),
              ),
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
                    label: "Rad qilish",
                    color: context.colors.bgTertiary,
                    foregroundColor: context.colors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
