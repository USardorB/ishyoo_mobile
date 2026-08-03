import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/core/utils/app_validators.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/postings/presentation/widgets/skills_selection_sheet.dart';

class CreateVacancyRequirementsStep extends HookWidget {
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

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "postings.create.description",
              style: context.textThemes.h5,
            ).tr(),
            const SizedBox(height: 20),

            // About Vacancy
            Text(
              "postings.create.description".tr(),
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            AppInputField(
              controller: descriptionController,
              minLines: 4,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              validator: AppValidators.required,
            ),
            const SizedBox(height: 16),

            // Tasks / Responsibilities
            Text(
              "postings.create.responsibilities".tr(),
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            AppInputField(
              controller: tasksController,
              minLines: 4,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              validator: AppValidators.required,
            ),
            const SizedBox(height: 16),

            // Requirements
            Text(
              "postings.create.requirements".tr(),
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            AppInputField(
              controller: requirementsController,
              minLines: 4,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              validator: AppValidators.required,
            ),
            const SizedBox(height: 16),

            // Skills
            Text(
              "postings.keySkills".tr(),
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
                        color: context.colors.brandDefault,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "postings.create.add",
                        style: context.textThemes.b2.copyWith(
                          color: context.colors.brandDefault,
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
              "postings.create.experience".tr(),
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
                return AppButton(
                  label: "postings.create.continueButton".tr(),
                  enabled: true,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      onNext();
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
