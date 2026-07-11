import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/postings/presentation/widgets/skills_selection_sheet.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';

class CreateVacancyRequirementsStep extends StatelessWidget {
  final TextEditingController descriptionController;
  final List<String> selectedSkills;
  final ValueChanged<List<String>> onSkillsChanged;
  final ExperienceLevel selectedExperience;
  final ValueChanged<ExperienceLevel> onExperienceSelected;
  final VoidCallback onNext;

  const CreateVacancyRequirementsStep({
    super.key,
    required this.descriptionController,
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
          AppInputField(
            label: "TAVSIF",
            controller: descriptionController,
            minLines: 4,
            maxLines: 6,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("142 / 2000", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
          ),
          const SizedBox(height: 16),
          Text("KO'NIKMALAR", style: context.textThemes.s3),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...selectedSkills.map((skill) => Chip(
                label: Text(skill),
                onDeleted: () {
                  final newSkills = List<String>.from(selectedSkills)..remove(skill);
                  onSkillsChanged(newSkills);
                },
                deleteIcon: const Icon(Icons.close, size: 16),
                backgroundColor: context.colors.brandDefault,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                labelStyle: context.textThemes.b3.copyWith(color: context.colors.midnightImmutable),
                deleteIconColor: context.colors.midnightImmutable,
              )),
              ActionChip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 16, color: context.colors.brandDefault),
                    const SizedBox(width: 4),
                    Text("Ko'nikma qo'shish", style: context.textThemes.b3.copyWith(color: context.colors.textPrimary)),
                  ],
                ),
                backgroundColor: Colors.transparent,
                side: BorderSide(color: context.colors.bgTertiary),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                onPressed: () async {
                  final result = await showModalBottomSheet<List<String>>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: context.colors.bgPrimary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (context) => SkillsSelectionSheet(initialSkills: selectedSkills),
                  );
                  if (result != null) {
                    onSkillsChanged(result);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text("TAJRIBA", style: context.textThemes.s3),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
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
                selectedColor: context.colors.brandDefault,
                side: BorderSide(
                  color: isSelected ? context.colors.brandDefault : context.colors.bgSecondary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelStyle: context.textThemes.b3.copyWith(
                  color: isSelected ? context.colors.midnightImmutable : context.colors.textSecondary,
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
