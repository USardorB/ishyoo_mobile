import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/utils/app_validators.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

class ResumeExperienceForm extends StatelessWidget {
  final TextEditingController companyController;
  final TextEditingController positionController;
  final TextEditingController descriptionController;
  final String location;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isWorking;
  final ValueChanged<bool> onWorkingChanged;
  final VoidCallback? onStartMonthTapped;
  final VoidCallback? onEndMonthTapped;
  final VoidCallback? onLocationTapped;

  const ResumeExperienceForm({
    super.key,
    required this.companyController,
    required this.positionController,
    required this.descriptionController,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.isWorking,
    required this.onWorkingChanged,
    this.onStartMonthTapped,
    this.onEndMonthTapped,
    this.onLocationTapped,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return "resume.searchPlaceholder".tr();
    return "${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final startStr = _formatDate(startDate);
    final endStr = _formatDate(endDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildTextField(
          context,
          "resume.companyPlaceholder".tr(),
          "Masalan: Uzum bank",
          controller: companyController,
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.organizationName],
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 24),
        _buildTextField(
          context,
          "resume.specializationPlaceholder".tr(),
          "Masalan: UX/UI Dizayner",
          controller: positionController,
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.jobTitle],
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 24),
        _buildActionField(
          context,
          "resume.location".tr(),
          location,
          onTap: onLocationTapped,
        ),
        const SizedBox(height: 24),
        _buildTextField(
          context,
          "resume.description".tr(),
          "Vazifalaringizni kiriting",
          controller: descriptionController,
          maxLines: 4,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          validator: (v) => AppValidators.required(v), // or null if optional, assuming required
        ),
        const SizedBox(height: 24),
        Text(
          "resume.yearHint".tr(),
          style: context.textThemes.c2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        _buildActionField(
          context,
          "",
          startStr,
          hasLabel: false,
          onTap: onStartMonthTapped,
        ),
        const SizedBox(height: 24),
        Text(
          "resume.present".tr(),
          style: context.textThemes.c2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        _buildActionField(
          context,
          "",
          isWorking ? "resume.present".tr() : endStr,
          hasLabel: false,
          isPlaceholder: isWorking,
          onTap: isWorking ? null : onEndMonthTapped,
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () => onWorkingChanged(!isWorking),
          child: Row(
            children: [
              Text(
                "shared.present",
                style: context.textThemes.b2,
              ).tr(),
              const Spacer(),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isWorking
                      ? context.colors.brandProgress
                      : Colors.transparent,
                  border: Border.all(
                    color: isWorking
                        ? context.colors.brandProgress
                        : context.colors.textSecondary,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: isWorking
                    ? const Icon(Icons.check, color: Colors.black, size: 16)
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label,
    String hint, {
    required TextEditingController controller,
    int maxLines = 1,
    bool hasLabel = true,
    bool isPlaceholder = false,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    Iterable<String>? autofillHints,
    String? Function(String?)? validator,
  }) {
    return AppInputField(
      label: hasLabel ? label : null,
      hintText: hint,
      controller: controller,
      maxLines: maxLines,
      enabled: !isPlaceholder,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      autofillHints: autofillHints?.toList() ?? const [],
      validator: validator ?? AppValidators.required,
    );
  }

  Widget _buildActionField(
    BuildContext context,
    String label,
    String value, {
    bool hasLabel = true,
    bool isPlaceholder = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLabel) ...[
          Text(
            label,
            style: context.textThemes.c2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        InkWell(
          onTap: onTap ?? () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: context.colors.bgSecondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: context.textThemes.b2.copyWith(
                      color: isPlaceholder
                          ? context.colors.textSecondary
                          : context.colors.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: context.colors.textSecondary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
