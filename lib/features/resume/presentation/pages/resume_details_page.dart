import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_detail_bloc.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_contacts_section.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_education_section.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_experience_section.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_menu_sheet.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_skills_section.dart';

@RoutePage()
class ResumeDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  final String id;

  const ResumeDetailsPage({super.key, required this.id});

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
            onPressed: () {
              AppNotificationOverlay.instance.show(
                message: "resume.actions.comingSoon".tr(),
                type: AppNotificationType.warning,
              );
            },
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => BlocProvider.value(
                  value: context.read<ResumeFormBloc>(),
                  child: ResumeMenuSheet(resumeId: id),
                ),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: BlocBuilder<ResumeDetailBloc, ResumeDetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text(state.error!));
          }

          final resume = state.resume;
          if (resume == null) {
            return Center(child: const Text("resume.noData").tr());
          }

          final employmentTypeStr = (resume.employmentType ?? [])
              .map((e) => EmploymentType.fromServer(e)?.localizedLabel)
              .join(', ');
          final workFormatStr = (resume.workFormat ?? [])
              .map((e) => WorkFormat.fromServer(e)?.localizedLabel)
              .join(', ');
          final workStr = [
            employmentTypeStr,
            workFormatStr,
          ].where((s) => s.isNotEmpty).join(' • ');

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: context.colors.bgTertiary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  child: Text(
                    resume.specialization ?? "",
                    style: context.textThemes.s1,
                  ),
                ),
                const SizedBox(height: 8),
                if (workStr.isNotEmpty)
                  Text(
                    workStr,
                    textAlign: TextAlign.center,
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                const SizedBox(height: 24),
                AppButton(
                  onTap: () {
                    context.pushRoute(
                      CreateResumeFlowRoute(resume: resume),
                    );
                  },
                  label: "resume.actions.edit".tr(),
                  color: context.colors.bgSecondary,
                  foregroundColor: context.colors.textPrimary,
                ),
                const SizedBox(height: 32),
                _buildSectionTitle(context, "resume.contacts"),
                const SizedBox(height: 16),
                const ResumeContactsSection(),
                const SizedBox(height: 32),
                _buildSectionTitle(context, "resume.experience"),
                const SizedBox(height: 16),
                ResumeExperienceSection(experiences: resume.experiences ?? []),
                const SizedBox(height: 32),
                _buildSectionTitle(context, "resume.education"),
                const SizedBox(height: 16),
                ResumeEducationSection(educations: resume.educations ?? []),
                const SizedBox(height: 32),
                _buildSectionTitle(context, "resume.skills"),
                const SizedBox(height: 16),
                ResumeSkillsSection(
                  skills: resume.skills ?? [],
                  languages: resume.languages ?? [],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String key) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        key,
        style: context.textThemes.s1,
      ).tr(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ResumeDetailBloc>()..add(LoadResumeDetail(id)),
        ),
        BlocProvider(
          create: (_) => sl<ResumeFormBloc>(),
        ),
      ],
      child: this,
    );
  }
}
