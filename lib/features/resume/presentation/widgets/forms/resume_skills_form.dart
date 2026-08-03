import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';

class ResumeSkillsForm extends HookWidget {
  const ResumeSkillsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResumeFormBloc>();
    final controller = useTextEditingController();
    final langController = useTextEditingController();
    final levelController = useTextEditingController();

    return BlocBuilder<ResumeFormBloc, ResumeFormState>(
      builder: (context, state) {
        final List<String> skills = List<String>.from(
          state.formData['skills'] ?? [],
        );
        final List<Map<String, dynamic>> languages =
            List<Map<String, dynamic>>.from(
              (state.formData['languages'] as List?)?.map((e) {
                    if (e is Map) return Map<String, dynamic>.from(e);
                    if (e.runtimeType.toString() == 'ResumeLanguage') {
                      return {
                        'lang': (e as dynamic).lang,
                        'level': (e as dynamic).level,
                      };
                    }
                    return <String, dynamic>{};
                  }) ??
                  [],
            );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            AppInputField(
              label: "resume.skills".tr(),
              hintText: "resume.hints.skill".tr(),
              controller: controller,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) {
                if (value.trim().isNotEmpty && !skills.contains(value.trim())) {
                  final newSkills = List<String>.from(skills)
                    ..add(value.trim());
                  bloc.add(UpdateFormData({'skills': newSkills}));
                  controller.clear();
                }
              },
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map(
                    (skill) => _buildSkillChip(context, skill, () {
                      final newSkills = List<String>.from(skills)
                        ..remove(skill);
                      bloc.add(UpdateFormData({'skills': newSkills}));
                    }),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),
            Text(
              "resume.languages".tr(),
              style: context.textThemes.h5,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppInputField(
                    label: "resume.languageLabel".tr(),
                    hintText: "resume.hints.language".tr(),
                    controller: langController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "resume.levelLabel".tr(),
                        style: context.textThemes.s3,
                      ),
                      const SizedBox(height: 8),
                      ListenableBuilder(
                        listenable: levelController,
                        builder: (context, _) {
                          return Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: context.colors.bgPrimary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: levelController.text.isEmpty
                                    ? null
                                    : levelController.text,
                                hint: Text(
                                  "resume.hints.level".tr(),
                                  style: context.textThemes.buttonLarge
                                      .copyWith(
                                        color: context.colors.textSecondary,
                                      ),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 24,
                                ),
                                isExpanded: true,
                                style: context.textThemes.buttonLarge.copyWith(
                                  color: context.colors.textPrimary,
                                ),
                                dropdownColor: context.colors.bgPrimary,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    levelController.text = newValue;
                                  }
                                },
                                items:
                                    [
                                      'fluent',
                                      'intermediate',
                                      'upper-intermediate',
                                    ].map((level) {
                                      return DropdownMenuItem<String>(
                                        value: level,
                                        child: Text(
                                          "resume.levels.$level".tr(),
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppButton(
              onTap: () {
                final lang = langController.text.trim();
                final level = levelController.text.trim();
                if (lang.isNotEmpty && level.isNotEmpty) {
                  final newLangs = List<Map<String, dynamic>>.from(languages)
                    ..add({'lang': lang, 'level': level});
                  bloc.add(UpdateFormData({'languages': newLangs}));
                  langController.clear();
                  levelController.clear();
                }
              },
              label: "resume.actions.addLanguage".tr(),
              color: context.colors.brandProgress,
              foregroundColor: context.colors.brandDefault,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: languages
                  .map(
                    (langMap) => _buildLanguageChip(context, langMap, () {
                      final newLangs =
                          List<Map<String, dynamic>>.from(languages)
                            ..removeWhere(
                              (l) =>
                                  l['lang'] == langMap['lang'] &&
                                  l['level'] == langMap['level'],
                            );
                      bloc.add(UpdateFormData({'languages': newLangs}));
                    }),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }

  Widget _buildSkillChip(
    BuildContext context,
    String label,
    VoidCallback onRemove,
  ) {
    return Chip(
      label: Text(label),
      onDeleted: onRemove,
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
    );
  }

  Widget _buildLanguageChip(
    BuildContext context,
    Map<String, dynamic> langMap,
    VoidCallback onRemove,
  ) {
    return Chip(
      label: Text("${langMap['lang']} - ${langMap['level']}"),
      onDeleted: onRemove,
      deleteIcon: const Icon(Icons.close, size: 16),
      backgroundColor: context.colors.bgSecondary,
      side: BorderSide(color: context.colors.lineSecondary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      labelStyle: context.textThemes.b3.copyWith(
        color: context.colors.textPrimary,
      ),
      deleteIconColor: context.colors.textSecondary,
    );
  }
}
