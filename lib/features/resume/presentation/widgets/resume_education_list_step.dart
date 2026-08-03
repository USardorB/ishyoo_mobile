import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';

class ResumeEducationListStep extends StatelessWidget {
  const ResumeEducationListStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResumeFormBloc, ResumeFormState>(
      builder: (context, state) {
        final List<dynamic> rawEducations = state.formData['educations'] ?? [];
        final educations = rawEducations
            .map((e) => ResumeEducation.fromJson(Map<String, dynamic>.from(e)))
            .toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ...educations.asMap().entries.map((entry) {
              final index = entry.key;
              final edu = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildEducationCard(context, edu, index),
              );
            }),
            const SizedBox(height: 24),
            AppButton(
              onTap: () async {
                final result = await context.pushRoute(
                  EditResumeEducationRoute(),
                );
                if (result != null &&
                    result is Map<String, dynamic> &&
                    result['action'] == 'save') {
                  final newEducations = List<Map<String, dynamic>>.from(
                    state.formData['educations'] ?? [],
                  );
                  newEducations.add(result);
                  if (context.mounted) {
                    context.read<ResumeFormBloc>().add(
                      UpdateFormData({'educations': newEducations}),
                    );
                  }
                }
              },
              icon: Icons.add,
              label: "resume.actions.add".tr(),
              color: context.colors.brandProgress,
              foregroundColor: context.colors.brandDefault,
              labelStyle: context.textThemes.buttonMedium,
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }

  Widget _buildEducationCard(
    BuildContext context,
    ResumeEducation edu,
    int index,
  ) {
    return InkWell(
      onTap: () async {
        final result = await context.pushRoute(
          EditResumeEducationRoute(education: edu),
        );
        if (result != null &&
            result is Map<String, dynamic> &&
            context.mounted) {
          final bloc = context.read<ResumeFormBloc>();
          final currentData = bloc.state.formData;
          final newEducations = List<Map<String, dynamic>>.from(
            currentData['educations'] ?? [],
          );

          if (result['action'] == 'delete') {
            newEducations.removeAt(index);
          } else if (result['action'] == 'save') {
            newEducations[index] = result;
          }

          bloc.add(UpdateFormData({'educations': newEducations}));
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
                Expanded(
                  child: Text(
                    edu.school,
                    style: context.textThemes.s1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
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
              edu.degree,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${edu.startDate?.year ?? ''} - ${edu.endDate?.year ?? 'resume.present'.tr()}",
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
