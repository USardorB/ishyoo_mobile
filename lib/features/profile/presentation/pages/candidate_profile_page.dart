import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/profile/presentation/bloc/candidate_profile_bloc.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_education_section.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_experience_section.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_languages_section.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_profile_header.dart';
import 'package:mobile/features/profile/presentation/widgets/candidate_resumes_section.dart';
import 'package:mobile/features/resume/data/models/resume.dart';

@RoutePage()
class CandidateProfilePage extends StatelessWidget {
  const CandidateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CandidateProfileBloc>()..add(LoadCandidateProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("profile.title").tr(),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () => context.pushRoute(const SettingsRoute()),
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: BlocBuilder<CandidateProfileBloc, CandidateProfileState>(
          builder: (context, state) {
            if (state.isLoading && state.resumes == null) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text(state.error!));
            }

            final resumes = state.resumes ?? [];
            final experiences = resumes
                .expand((r) => r.experiences ?? <ResumeExperience>[])
                .take(3)
                .toList();
            final educations = resumes
                .expand((r) => r.educations ?? <ResumeEducation>[])
                .take(3)
                .toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                bottom: MediaQuery.paddingOf(context).bottom + 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CandidateProfileHeader(),
                  const SizedBox(height: 16),
                  ListTile(
                    onTap: () => context.pushRoute(const SavedVacanciesRoute()),
                    leading: Icon(
                      Icons.bookmark_border,
                      color: context.colors.brandDefault,
                    ),
                    title: Text(
                      "opportunities.saved_vacancies",
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: const Icon(Icons.chevron_right),
                    tileColor: context.colors.bgSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "profile.resumes"),
                  const SizedBox(height: 12),
                  CandidateResumesSection(resumes: resumes),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "profile.experience"),
                  const SizedBox(height: 12),
                  CandidateExperienceSection(experiences: experiences),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "profile.education"),
                  const SizedBox(height: 12),
                  CandidateEducationSection(educations: educations),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "profile.languages"),
                  const SizedBox(height: 12),
                  const CandidateLanguagesSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String key) {
    return Text(
      key,
      style: context.textThemes.s2,
    ).tr();
  }
}
