import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';
import 'package:mobile/features/resume/presentation/widgets/delete_resume_dialog.dart';

class ResumeMenuSheet extends StatelessWidget {
  final String resumeId;
  const ResumeMenuSheet({super.key, required this.resumeId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResumeFormBloc, ResumeFormState>(
      listener: (context, state) {
        if (state.isDeleted) {
          context.pop();
          context.maybePop();
        } else if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(
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
              icon: Icons.rocket_launch_outlined,
              label: "shared.saved_success".tr(),
              onTap: () {
                context.read<ResumeFormBloc>().add(BoostResume(resumeId));
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("shared.saved_success".tr())),
                );
              },
            ),
            Divider(color: context.colors.bgTertiary, height: 1),
            _MenuItem(
              icon: Icons.picture_as_pdf_outlined,
              label: "resume.download_pdf".tr(),
              onTap: () {
                context.pop();
                context.pushRoute(ResumePdfPreviewRoute(resumeId: resumeId));
              },
            ),
            Divider(color: context.colors.bgTertiary, height: 1),
            _MenuItem(
              icon: Icons.delete_outline,
              label: "shared.delete".tr(),
              isDestructive: true,
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (_) => const DeleteResumeDialog(),
                );
                if (confirmed == true && context.mounted) {
                  context.read<ResumeFormBloc>().add(DeleteResume(resumeId));
                }
              },
            ),
          ],
        ),
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
    final color = isDestructive
        ? context.colors.danger
        : context.colors.textPrimary;
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
