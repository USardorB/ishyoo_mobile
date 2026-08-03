import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/core/utils/app_validators.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

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
          "resume.institution".tr(),
          "resume.hints.institution".tr(),
          controller: schoolController,
          maxLines: 2,
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.organizationName],
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 24),
        _buildTextField(
          context,
          "resume.degree".tr(),
          "resume.hints.degree".tr(),
          controller: degreeController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 24),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: _buildTextField(
                context,
                "resume.yearHint".tr(),
                "resume.hints.year".tr(),
                controller: startYearController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Expanded(
              child: _buildTextField(
                context,
                "resume.yearHint".tr(),
                "resume.hints.year".tr(),
                controller: endYearController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
        if (showSaveButton) ...[
          const SizedBox(height: 32),
          AppButton(
            onTap: onSave ?? () {},
            label: "resume.actions.save".tr(),
            color: context.colors.brandDefault,
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
    TextInputAction? textInputAction,
    Iterable<String>? autofillHints,
    String? Function(String?)? validator,
  }) {
    return AppInputField(
      label: label,
      hintText: hint,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      autofillHints: autofillHints?.toList() ?? const [],
      validator: validator ?? AppValidators.required,
    );
  }
}
