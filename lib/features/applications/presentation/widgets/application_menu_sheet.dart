import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/applications/data/models/application.dart';
import 'package:mobile/features/applications/presentation/widgets/delete_application_dialog.dart';
import 'package:mobile/features/applications/presentation/widgets/reject_application_dialog.dart';

class ApplicationMenuSheet extends StatelessWidget {
  final VoidCallback onRefuse;
  final Application application;

  const ApplicationMenuSheet({
    super.key,
    required this.onRefuse,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 16,
      ),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _MenuItem(
            icon: Icons.chat_bubble_outline,
            label: "nav.chats".tr(),
            onTap: () {
              context.pop();
              context.pushRoute(
                ChatDetailsRoute(chatId: "application.chatId!"),
              );
            },
          ),
          _buildDivider(context),
          _MenuItem(
            icon: Icons.description_outlined,
            label: "opportunities.description".tr(),
            onTap: () {
              context.pop();
              context.pushRoute(
                VacancyDetailsRoute(id: application.vacancyId!),
              );
            },
          ),
          _buildDivider(context),
          _MenuItem(
            icon: Icons.business_center_outlined,
            label: "profile.about_company".tr(),
            onTap: () {
              context.pop();
              if (application.vacancy?.organization != null) {
                context.pushRoute(
                  CompanyDetailsRoute(
                    organization: application.vacancy!.organization!,
                  ),
                );
              }
            },
          ),
          _buildDivider(context),
          _MenuItem(
            icon: Icons.cancel_outlined,
            label: "applications.tabs.rejected".tr(),
            onTap: () {
              context.pop();
              showDialog(
                context: context,
                builder: (_) => RejectApplicationDialog(
                  onConfirm: onRefuse,
                ),
              );
            },
          ),
          _buildDivider(context),
          _MenuItem(
            icon: Icons.delete_outline,
            label: "shared.delete".tr(),
            isDestructive: true,
            onTap: () {
              context.pop();
              showDialog(
                context: context,
                builder: (_) => DeleteApplicationDialog(
                  onDeleteTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      color: context.colors.lineSecondary,
      height: 25,
      thickness: .5,
      indent: 16,
      endIndent: 16,
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isDestructive;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDestructive
        ? context.colors.danger
        : context.colors.textPrimary;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: context.colors.bgSecondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: isDestructive
                      ? context.colors.danger
                      : context.colors.textSecondary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: context.textThemes.buttonLarge.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
