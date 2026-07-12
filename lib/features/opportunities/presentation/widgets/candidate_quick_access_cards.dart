import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

class CandidateQuickAccessCards extends StatelessWidget {
  const CandidateQuickAccessCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: _QuickAccessCard(
            title: "Yaqinlikdagi ish",
            icon: Icons.location_on_outlined,
            iconColor: context.colors.info,
            onTap: () => context.pushRoute(const NearbyJobsRoute()),
          ),
        ),
        Expanded(
          child: _QuickAccessCard(
            title: "Rezyumeni yaxshilash",
            icon: Icons.insights_outlined,
            iconColor: context.colors.success,
            onTap: () {},
          ),
        ),
        Expanded(
          child: _QuickAccessCard(
            title: "Karyera maqolalari",
            icon: Icons.assignment_outlined,
            iconColor: context.colors.warning,
            onTap: () {},
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
      borderRadius: .circular(16),
      child: Container(
        padding: const .all(12),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: .circular(16),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              title,
              style: context.textThemes.buttonMedium,
              maxLines: 2,
              overflow: .ellipsis,
            ),
            const SizedBox(height: 6),
            Align(
              alignment: .bottomRight,
              child: Container(
                padding: const .all(13),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: .circle,
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
