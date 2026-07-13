import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/applications/presentation/widgets/application_menu_sheet.dart';
import 'package:mobile/features/applications/presentation/widgets/reject_application_dialog.dart';

class ApplicationCard extends StatelessWidget {
  final String status;

  const ApplicationCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusBgColor;
    Color statusTextColor = Colors.white;

    if (status == "Rad etildi") {
      statusBgColor = context.colors.danger;
    } else if (status == "Ko'rib chiqdi") {
      statusBgColor = context.colors.success;
    } else {
      statusBgColor = context.colors.bgTertiary;
      statusTextColor = context.colors.textPrimary;
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
                "Uzum Bank",
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
                  status,
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
                  builder: (_) => const ApplicationMenuSheet(),
                ),
                icon: Icon(Icons.more_vert, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "UX/UI Dizayner",
            style: context.textThemes.s1,
          ),
          const SizedBox(height: 12),
          Text(
            "Toshkent • To'liq stavka • Tajriba 1-3 yil",
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
                "Mar 31, 2024",
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
                      "15 mln so'm",
                      style: context.textThemes.s2,
                    ),
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
                "12 минут назад",
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
                    onTap: () {},
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
                      builder: (_) => const RejectApplicationDialog(),
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
