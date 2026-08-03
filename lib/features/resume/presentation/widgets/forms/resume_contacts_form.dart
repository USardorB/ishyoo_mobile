import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';
import 'package:mobile/features/resume/presentation/widgets/specializations_sheet.dart';

class ResumeContactsForm extends HookWidget {
  const ResumeContactsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ResumeFormBloc>();
    final formData = bloc.state.formData;

    final emailController = useTextEditingController(
      text: formData['email']?.toString() ?? '',
    );
    final phoneController = useTextEditingController(
      text: formData['phone']?.toString() ?? '',
    );
    final specializationController = useTextEditingController(
      text: formData['specialization']?.toString() ?? '',
    );
    final salaryController = useTextEditingController(
      text: formData['expected_salary']?.toString() ?? '',
    );
    final currency = useState<AppCurrency>(
      AppCurrency.fromServer(formData['currency']?.toString()) ?? AppCurrency.uzs,
    );
    final employmentType = useState<List<String>>(
      (formData['employment_type'] as List?)?.cast<String>() ?? [],
    );
    final workFormat = useState<List<String>>(
      (formData['work_format'] as List?)?.cast<String>() ?? [],
    );

    void updateData() {
      final salary = int.tryParse(salaryController.text);
      bloc.add(
        UpdateFormData({
          'email': emailController.text,
          'phone': phoneController.text,
          'specialization': specializationController.text,
          'expected_salary': salary,
          'currency': currency.value.serverValue,
          'employment_type': employmentType.value,
          'work_format': workFormat.value,
        }),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        AppInputField(
          label: "resume.specializationPlaceholder".tr(),
          controller: specializationController,
          readOnly: true,
          onTap: () async {
            final spec = await showModalBottomSheet<String>(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (_) => const SpecializationsSheet(),
            );
            if (spec != null) {
              specializationController.text = spec;
              updateData();
            }
          },
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: AppInputField(
                label: "resume.expectedSalary".tr(),
                controller: salaryController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onChanged: (_) => updateData(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "resume.currency".tr(),
                    style: context.textThemes.c2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(color: context.colors.lineSecondary),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<AppCurrency>(
                        value: currency.value,
                        isExpanded: true,
                        dropdownColor: context.colors.bgPrimary,
                        items: AppCurrency.values.map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c.displayCode, style: context.textThemes.b1),
                        )).toList(),
                        onChanged: (v) {
                          if (v != null) {
                            currency.value = v;
                            updateData();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          "resume.employmentType".tr(),
          style: context.textThemes.c2.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: EmploymentType.values.map((e) {
            final isSelected = employmentType.value.contains(e.serverValue);
            return FilterChip(
              label: Text(e.localizedLabel),
              selected: isSelected,
              onSelected: (selected) {
                final list = List<String>.from(employmentType.value);
                if (selected) {
                  list.add(e.serverValue);
                } else {
                  list.remove(e.serverValue);
                }
                employmentType.value = list;
                updateData();
              },
              backgroundColor: context.colors.bgSecondary,
              selectedColor: context.colors.brandProgress.withValues(alpha: 0.1),
              checkmarkColor: context.colors.brandDefault,
              labelStyle: context.textThemes.b2.copyWith(
                color: isSelected ? context.colors.brandDefault : context.colors.textPrimary,
              ),
              side: BorderSide(
                color: isSelected ? context.colors.brandDefault : context.colors.lineSecondary,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        Text(
          "resume.workFormat".tr(),
          style: context.textThemes.c2.copyWith(color: context.colors.textSecondary),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: WorkFormat.values.map((w) {
            final isSelected = workFormat.value.contains(w.serverValue);
            return FilterChip(
              label: Text(w.localizedLabel),
              selected: isSelected,
              onSelected: (selected) {
                final list = List<String>.from(workFormat.value);
                if (selected) {
                  list.add(w.serverValue);
                } else {
                  list.remove(w.serverValue);
                }
                workFormat.value = list;
                updateData();
              },
              backgroundColor: context.colors.bgSecondary,
              selectedColor: context.colors.brandProgress.withValues(alpha: 0.1),
              checkmarkColor: context.colors.brandDefault,
              labelStyle: context.textThemes.b2.copyWith(
                color: isSelected ? context.colors.brandDefault : context.colors.textPrimary,
              ),
              side: BorderSide(
                color: isSelected ? context.colors.brandDefault : context.colors.lineSecondary,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        AppInputField(
          label: "resume.emailLabel".tr(),
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          readOnly: true,
        ),
        const SizedBox(height: 24),
        AppInputField(
          label: "resume.phoneLabel".tr(),
          controller: phoneController,
          keyboardType: TextInputType.phone,
          readOnly: true,
        ),
      ],
    );
  }
}
