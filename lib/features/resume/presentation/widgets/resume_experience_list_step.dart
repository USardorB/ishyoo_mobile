import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';

class ResumeExperienceListStep extends StatelessWidget {
  const ResumeExperienceListStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeFormBloc, ResumeFormState>(
      builder: (context, state) {
        final List<dynamic> rawExperiences =
            state.formData['experiences'] ?? [];
        final experiences = rawExperiences
            .map((e) => ResumeExperience.fromJson(Map<String, dynamic>.from(e)))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            if (experiences.isNotEmpty)
              Text(
                "resume.sections.experience".tr(),
                style: context.textThemes.s1,
              ),
            const SizedBox(height: 16),
            ...experiences.asMap().entries.map((entry) {
              final index = entry.key;
              final exp = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildExperienceCard(context, exp, index),
              );
            }),
            const SizedBox(height: 24),
            AppButton(
              onTap: () async {
                final result = await context.pushRoute(
                  EditResumeExperienceRoute(),
                );
                if (result != null &&
                    result is Map<String, dynamic> &&
                    result['action'] == 'save') {
                  final newExperiences = List<Map<String, dynamic>>.from(
                    state.formData['experiences'] ?? [],
                  );
                  newExperiences.add(result);
                  if (context.mounted) {
                    context.read<ResumeFormBloc>().add(
                      UpdateFormData({'experiences': newExperiences}),
                    );
                  }
                }
              },
              icon: Icons.add,
              label: "resume.actions.add".tr(),
              color: context.colors.brandProgress.withValues(alpha: 0.15),
              foregroundColor: context.colors.brandProgress,
              labelStyle: context.textThemes.b2,
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    ResumeExperience exp,
    int index,
  ) {
    return InkWell(
      onTap: () async {
        final result = await context.pushRoute(
          EditResumeExperienceRoute(experience: exp),
        );
        if (result != null && result is Map<String, dynamic> && context.mounted) {
          final bloc = context.read<ResumeFormBloc>();
          final currentData = bloc.state.formData;
          final newExperiences = List<Map<String, dynamic>>.from(
            currentData['experiences'] ?? [],
          );

          if (result['action'] == 'delete') {
            newExperiences.removeAt(index);
          } else if (result['action'] == 'save') {
            newExperiences[index] = result;
          }

          bloc.add(UpdateFormData({'experiences': newExperiences}));
        }
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exp.position,
                  style: context.textThemes.s1,
                ),
                Icon(
                  Icons.chevron_right,
                  color: context.colors.textSecondary,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              exp.companyName,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${exp.startDate?.year ?? ''} - ${exp.endDate?.year ?? 'resume.present'.tr()}",
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            if (exp.description != null && exp.description!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  height: 1,
                  color: context.colors.bgTertiary,
                ),
              ),
              Text(
                exp.description!,
                style: context.textThemes.b2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
