import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';

class ResumeSkillsForm extends HookWidget {
  const ResumeSkillsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResumeFormBloc>();
    final controller = useTextEditingController();

    return BlocBuilder<ResumeFormBloc, ResumeFormState>(
      builder: (context, state) {
        final List<String> skills = List<String>.from(
          state.formData['skills'] ?? [],
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            AppInputField(
              label: "Ko'nikmalar",
              hintText: "Ko'nikma kiriting (Masalan: Figma)",
              controller: controller,
              keyboardType: TextInputType.text,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.bgTertiary.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textThemes.b2,
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onRemove,
            child: Icon(
              Icons.close,
              size: 16,
              color: context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
