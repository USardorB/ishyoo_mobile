import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/presentation/widgets/delete_resume_dialog.dart';

class ResumeMenuSheet extends StatelessWidget {
  const ResumeMenuSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 16,
      ),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _MenuItem(
            icon: Icons.file_download_outlined,
            label: "Yuklab olish",
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: context.colors.bgTertiary, height: 1),
          _MenuItem(
            icon: Icons.copy_outlined,
            label: "Nusxa qilish",
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: context.colors.bgTertiary, height: 1),
          _MenuItem(
            icon: Icons.delete_outline,
            label: "O'chirish",
            isDestructive: true,
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (_) => const DeleteResumeDialog(),
              );
            },
          ),
        ],
      ),
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
    final color = isDestructive ? context.colors.danger : context.colors.textPrimary;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colors.bgSecondary,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: context.textThemes.b1.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
