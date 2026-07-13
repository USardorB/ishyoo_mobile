import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/postings/presentation/widgets/skills_selection_sheet.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';

class CreateVacancyRequirementsStep extends StatelessWidget {
  final TextEditingController descriptionController;
  final TextEditingController tasksController;
  final TextEditingController requirementsController;
  final List<String> selectedSkills;
  final ValueChanged<List<String>> onSkillsChanged;
  final ExperienceLevel selectedExperience;
  final ValueChanged<ExperienceLevel> onExperienceSelected;
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Tavsif va talablar", style: context.textThemes.h5),
          const SizedBox(height: 20),

          // About Vacancy
          Text(
            "VAKANSIYA HAQIDA",
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
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "187 / 500",
                style: TextStyle(color: Color(0xFFC0CA33), fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Tasks
          Text(
            "VAZIFALAR",
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          AppInputField(
            controller: tasksController,
            minLines: 5,
            maxLines: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "198 / 1000",
                style: context.textThemes.c2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Requirements
          Text(
            "TALABLAR",
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
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "156 / 1000",
                style: context.textThemes.c2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Skills
          Text(
            "KO'NIKMALAR",
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
          InkWell(
            onTap: () async {
              final result = await showModalBottomSheet<List<String>>(
                context: context,
                isScrollControlled: true,
                backgroundColor: context.colors.bgPrimary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) =>
                    SkillsSelectionSheet(initialSkills: selectedSkills),
              );
              if (result != null) {
                onSkillsChanged(result);
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: context.colors.bgSecondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.colors.bgTertiary),
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
                    "Ko'nikma qo'shish",
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.brandProgress,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Experience
          Text(
            "TAJRIBA",
            style: context.textThemes.c1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ExperienceLevel.values.map((level) {
              final isSelected = selectedExperience == level;
              return ChoiceChip(
                label: Text(level.title),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) onExperienceSelected(level);
                },
                showCheckmark: false,
                backgroundColor: context.colors.bgSecondary,
                selectedColor: context.colors.bgTertiary,
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
          AppButton(
            label: "Davom etish",
            onTap: onNext,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
