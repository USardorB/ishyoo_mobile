import 'package:auto_route/auto_route.dart';
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
        borderRadius: const .vertical(top: .circular(20)),
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: context.colors.bgTertiary,
                borderRadius: .circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _MenuItem(
            icon: Icons.chat_bubble_outline,
            label: "Chatga yozish",
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
            label: "Vakansiyani ko'rish",
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
            label: "Kompaniyani ko'rish",
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
            label: "Rad etish",
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
            label: "Javobni o'chirish",
            isDestructive: true,
            onTap: () {
              context.pop();
              showDialog(
                context: context,
                builder: (_) => DeleteApplicationDialog(
                  onDeleteTap: () {
                    throw UnimplementedError();
                    // context.read<>()
                  },
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
      type: .transparency,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const .symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const .all(6),
                decoration: BoxDecoration(
                  color: context.colors.bgSecondary,
                  borderRadius: .circular(8),
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
