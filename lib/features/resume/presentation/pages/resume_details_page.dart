import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_menu_sheet.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_stats_section.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_contacts_section.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_experience_section.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_education_section.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_skills_section.dart';

@RoutePage()
class ResumeDetailsPage extends StatelessWidget {
  const ResumeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const ResumeMenuSheet(),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: MediaQuery.paddingOf(context).bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: context.colors.bgTertiary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 40), // Placeholder avatar
            ),
            const SizedBox(height: 16),
            Text(
              "UX UI Designer",
              style: context.textThemes.s1,
            ),
            const SizedBox(height: 8),
            Text(
              "Doimiy ish joyi • Ish joyida ish beruvchi,\nGibrid • Tayyor xizmat safarlariga",
              textAlign: TextAlign.center,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              onTap: () {},
              label: "Tahrirlash",
              color: context.colors.bgSecondary,
              foregroundColor: context.colors.textPrimary,
            ),
            const SizedBox(height: 32),
            _buildSectionTitle(context, "Haftalik statistika"),
            const SizedBox(height: 16),
            const ResumeStatsSection(),
            const SizedBox(height: 32),
            _buildSectionTitle(context, "Kontaktlar"),
            const SizedBox(height: 16),
            const ResumeContactsSection(),
            const SizedBox(height: 32),
            _buildSectionTitle(context, "Ish tajribasi: 3 yil 6 oy"),
            const SizedBox(height: 16),
            const ResumeExperienceSection(),
            const SizedBox(height: 32),
            _buildSectionTitle(context, "Ta'lim"),
            const SizedBox(height: 16),
            const ResumeEducationSection(),
            const SizedBox(height: 32),
            _buildSectionTitle(context, "Ko'nikmalar"),
            const SizedBox(height: 16),
            const ResumeSkillsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: context.textThemes.s1,
      ),
    );
  }
}
