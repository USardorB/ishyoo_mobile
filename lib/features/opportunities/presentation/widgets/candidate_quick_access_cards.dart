import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';

class CandidateQuickAccessCards extends StatelessWidget {
  const CandidateQuickAccessCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickAccessCard(
            title: "opportunities.nearby_jobs".tr(),
            icon: Icons.location_on_outlined,
            iconColor: context.colors.info,
            onTap: () => context.pushRoute(const NearbyJobsRoute()),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _QuickAccessCard(
            title: "resume.create_resume".tr(),
            icon: Icons.insights_outlined,
            iconColor: context.colors.success,
            onTap: () {
              AppNotificationOverlay.instance.show(
                message: "shared.coming_soon".tr(),
                type: AppNotificationType.warning,
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _QuickAccessCard(
            title: "articles.title".tr(),
            icon: Icons.assignment_outlined,
            iconColor: context.colors.warning,
            onTap: () => context.pushRoute(const ArticlesRoute()),
          ),
        ),
      ],
    );
  }
}

class _QuickAccessCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const _QuickAccessCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconBgColor = iconColor.withValues(alpha: 0.15);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textThemes.buttonMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
