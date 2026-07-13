import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_profile_header.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_resumes_section.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_experience_section.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_education_section.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_languages_section.dart';

@RoutePage()
class CandidateProfilePage extends StatelessWidget {
  const CandidateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: MediaQuery.paddingOf(context).bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CandidateProfileHeader(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, "Mening rezyumelarim"),
            const SizedBox(height: 12),
            const CandidateResumesSection(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, "Ish tajribasi: 3 yil 6 oy"),
            const SizedBox(height: 12),
            const CandidateExperienceSection(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, "Ta'lim"),
            const SizedBox(height: 12),
            const CandidateEducationSection(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, "Tillar"),
            const SizedBox(height: 12),
            const CandidateLanguagesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.textThemes.s1,
    );
  }
}
