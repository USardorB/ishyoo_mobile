import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/postings/presentation/widgets/skills_selection_sheet.dart';

class CreateVacancyRequirementsStep extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController tasksController;
  final TextEditingController requirementsController;
  final List<String> selectedSkills;
  final ValueChanged<List<String>> onSkillsChanged;
  final AppExperienceLevel selectedExperience;
  final ValueChanged<AppExperienceLevel> onExperienceSelected;
  final VoidCallback onNext;

  const CreateVacancyRequirementsStep({
    super.key,
    required this.descriptionController,
    required this.tasksController,
    required this.requirementsController,
    required this.selectedSkills,
    required this.onSkillsChanged,
    required this.selectedExperience,
    required this.onExperienceSelected,
    required this.onNext,
  });

  bool _isValid() {
    return descriptionController.text.trim().isNotEmpty &&
        tasksController.text.trim().isNotEmpty &&
        requirementsController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("opportunities.description", style: context.textThemes.h5).tr(),
          const SizedBox(height: 20),

          // About Vacancy
          Text(
            "opportunities.description".tr(),
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          AppInputField(
            controller: descriptionController,
            minLines: 4,
            maxLines: 6,
          ),
          const SizedBox(height: 16),

          // Tasks / Responsibilities
          Text(
            "opportunities.responsibilities".tr(),
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          AppInputField(
            controller: tasksController,
            minLines: 4,
            maxLines: 6,
          ),
          const SizedBox(height: 16),

          // Requirements
          Text(
            "opportunities.requirements".tr(),
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          AppInputField(
            controller: requirementsController,
            minLines: 4,
            maxLines: 6,
          ),
          const SizedBox(height: 16),

          // Skills
          Text(
            "postings.key_skills".tr(),
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          if (selectedSkills.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selectedSkills
                  .map(
                    (skill) => Chip(
                      label: Text(skill),
                      onDeleted: () {
                        final newSkills = List<String>.from(selectedSkills)
                          ..remove(skill);
                        onSkillsChanged(newSkills);
                      },
                      deleteIcon: const Icon(Icons.close, size: 16),
                      backgroundColor: context.colors.brandDefault,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelStyle: context.textThemes.b3.copyWith(
                        color: context.colors.midnightImmutable,
                      ),
                      deleteIconColor: context.colors.midnightImmutable,
                    ),
                  )
                  .toList(),
            ),
          if (selectedSkills.isNotEmpty) const SizedBox(height: 12),
          Material(
            color: context.colors.bgSecondary,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () async {
                final result = await showModalBottomSheet<List<String>>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: context.colors.bgPrimary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.viewInsetsOf(context).bottom,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
                      ),
                      child: SkillsSelectionSheet(
                        initialSkills: selectedSkills,
                      ),
                    ),
                  ),
                );
                if (result != null) {
                  onSkillsChanged(result);
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: context.colors.bgTertiary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 20,
                      color: context.colors.brandProgress,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "shared.add",
                      style: context.textThemes.b2.copyWith(
                        color: context.colors.brandProgress,
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Experience
          Text(
            "profile.experience".tr(),
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: AppExperienceLevel.values.map((level) {
              final isSelected = selectedExperience == level;
              return ChoiceChip(
                label: Text(level.localizedLabel),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) onExperienceSelected(level);
                },
                showCheckmark: false,
                backgroundColor: context.colors.bgSecondary,
                selectedColor: context.colors.brandProgress,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelStyle: context.textThemes.b3.copyWith(
                  color: context.colors.textPrimary,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          ListenableBuilder(
            listenable: Listenable.merge([
              descriptionController,
              tasksController,
              requirementsController,
            ]),
            builder: (context, _) {
              final isValid = _isValid();
              return AppButton(
                label: "shared.continue".tr(),
                enabled: isValid,
                onTap: onNext,
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
