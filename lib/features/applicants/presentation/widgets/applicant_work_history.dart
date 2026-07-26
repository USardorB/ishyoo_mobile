import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/resume.dart';

class ApplicantWorkHistory extends StatelessWidget {
  final List<ResumeExperience> experiences;
  final String label;

  const ApplicantWorkHistory({
    super.key,
    required this.experiences,
    this.label = 'Ish tajribasi',
  });

  String _formatDate(DateTime? date) {
    if (date == null) return 'hozir';
    return '${date.year} yil';
  }

  @override
  Widget build(BuildContext context) {
    if (experiences.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: context.textThemes.s2),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 0; i < experiences.length; i++) ...[
                if (i > 0)
                  Divider(height: 24, color: context.colors.lineSecondary),
                _buildEntry(context, experiences[i]),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEntry(BuildContext context, ResumeExperience exp) {
    final isCurrent = exp.endDate == null;
    final duration =
        '${_formatDate(exp.startDate)} — ${_formatDate(exp.endDate)}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: CircleAvatar(
            radius: 8.5,
            backgroundColor: isCurrent
                ? context.colors.brandProgress
                : context.colors.bgSecondary,
            child: Icon(
              Icons.circle,
              size: 10,
              color: isCurrent
                  ? context.colors.brandDefault
                  : context.colors.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exp.position, style: context.textThemes.s2),
              const SizedBox(height: 4),
              Text(
                exp.companyName,
                style: context.textThemes.b1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                duration,
                style: context.textThemes.b2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
