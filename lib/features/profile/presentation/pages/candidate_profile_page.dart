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
          title: const Text("profile.candidate.personalInfo").tr(),
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

            final Map<String, dynamic> langMap = {};
            for (final r in resumes) {
              for (final l in (r.languages ?? [])) {
                langMap['${l.lang}-${l.level}'] = l;
              }
            }
            final languages = langMap.values.toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                bottom: MediaQuery.paddingOf(context).bottom + 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      "opportunities.savedVacancies",
                      style: context.textThemes.buttonLarge,
                    ).tr(),
                    trailing: const Icon(Icons.chevron_right),
                    tileColor: context.colors.bgPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSectionTitle(context, "profile.candidate.resumes"),
                      TextButton(
                        onPressed: () {
                          // TODO: Navigate to all resumes page
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "profile.candidate.viewAll".tr(),
                          style: context.textThemes.s3.copyWith(
                            color: context.colors.brandDefault,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CandidateResumesSection(
                    resumes:
                        (resumes.toList()..sort(
                              (a, b) =>
                                  (b.updatedAt ?? b.createdAt ?? DateTime.now())
                                      .compareTo(
                                        a.updatedAt ??
                                            a.createdAt ??
                                            DateTime.now(),
                                      ),
                            ))
                            .take(3)
                            .toList(),
                  ),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "profile.candidate.experience"),
                  const SizedBox(height: 12),
                  CandidateExperienceSection(experiences: experiences),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "profile.candidate.education"),
                  const SizedBox(height: 12),
                  CandidateEducationSection(educations: educations),
                  const SizedBox(height: 24),
                  _buildSectionTitle(context, "profile.candidate.languages"),
                  const SizedBox(height: 12),
                  CandidateLanguagesSection(languages: List.from(languages)),
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
