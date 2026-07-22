import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';

class CreateVacancySummaryStep extends StatelessWidget {
  final String title;
  final JobType jobType;
  final ExperienceLevel experience;
  final String description;
  final String? salaryFrom;
  final String? salaryTo;
  final String location;
  final VoidCallback onEditBasicInfo;
  final VoidCallback onEditRequirements;
  final VoidCallback onPost;
  final VoidCallback onSaveDraft;

  const CreateVacancySummaryStep({
    super.key,
    required this.title,
    required this.jobType,
    required this.experience,
    required this.description,
    this.salaryFrom,
    this.salaryTo,
    required this.location,
    required this.onEditBasicInfo,
    required this.onEditRequirements,
    required this.onPost,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Tayyor!", style: context.textThemes.h5),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.bgSecondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: context.colors.brandDefault,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text("U", style: context.textThemes.h5.copyWith(color: context.colors.midnightImmutable)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text("Uzum Bank", style: context.textThemes.b2),
                  ],
                ),
                const SizedBox(height: 12),
                Text(title.isEmpty ? 'Vakansiya nomi' : title, style: context.textThemes.h4),
                const SizedBox(height: 4),
                if (salaryFrom != null || salaryTo != null)
                  Text(
                    "${salaryFrom?.isNotEmpty == true ? salaryFrom : '0'}–${salaryTo?.isNotEmpty == true ? salaryTo : '0'} so'm",
                    style: context.textThemes.h5.copyWith(color: context.colors.brandDefault),
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildSmallTag(context, location.isEmpty ? 'Manzil' : location),
                    const SizedBox(width: 8),
                    _buildSmallTag(context, jobType.title),
                    const SizedBox(width: 8),
                    _buildSmallTag(context, experience.title),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  description.replaceAll('\n', ' '),
                  style: context.textThemes.b3.copyWith(color: context.colors.textSecondary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: Icon(Icons.edit_outlined, color: context.colors.brandDefault),
            title: Text("Asosiy ma'lumotlarni tahrirlash", style: context.textThemes.s2.copyWith(color: context.colors.brandDefault)),
            onTap: onEditBasicInfo,
            contentPadding: EdgeInsets.zero,
          ),
          ListTile(
            leading: Icon(Icons.edit_outlined, color: context.colors.brandDefault),
            title: Text("Tavsif va talablarni tahrirlash", style: context.textThemes.s2.copyWith(color: context.colors.brandDefault)),
            onTap: onEditRequirements,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 40),
          AppButton(
            label: "Vakansiyani joylashtirish",
            onTap: onPost,
          ),
          const SizedBox(height: 12),
          AppButton(
            label: "Qoralama sifatida saqlash",
            color: context.colors.bgSecondary,
            foregroundColor: context.colors.textPrimary,
            onTap: onSaveDraft,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSmallTag(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.bgTertiary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: context.textThemes.b3),
    );
  }
}
