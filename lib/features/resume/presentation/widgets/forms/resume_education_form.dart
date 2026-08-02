import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ResumeEducationForm extends StatelessWidget {
  final TextEditingController schoolController;
  final TextEditingController degreeController;
  final TextEditingController startYearController;
  final TextEditingController endYearController;
  final bool showSaveButton;
  final VoidCallback? onSave;

  const ResumeEducationForm({
    super.key,
    required this.schoolController,
    required this.degreeController,
    required this.startYearController,
    required this.endYearController,
    this.showSaveButton = true,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildTextField(
          context,
          "resume.sections.education".tr(),
          "Masalan: TATU",
          controller: schoolController,
          maxLines: 2,
        ),
        const SizedBox(height: 24),
        _buildTextField(
          context,
          "resume.specializationPlaceholder".tr(),
          "Masalan: Dasturiy injiniring",
          controller: degreeController,
        ),
        const SizedBox(height: 24),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: _buildTextField(
                context,
                "resume.yearHint".tr(),
                "2019",
                controller: startYearController,
                keyboardType: TextInputType.number,
              ),
            ),
            Expanded(
              child: _buildTextField(
                context,
                "resume.yearHint".tr(),
                "2023",
                controller: endYearController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        if (showSaveButton) ...[
          const SizedBox(height: 32),
          AppButton(
            onTap: onSave ?? () {},
            label: "resume.actions.save".tr(),
            color: context.colors.brandProgress,
            foregroundColor: Colors.black,
          ),
          const SizedBox(height: 32),
        ],
      ],
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    String hint, {
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textThemes.c2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: context.colors.bgSecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            style: context.textThemes.b2,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
