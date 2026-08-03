import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/core/utils/app_validators.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/postings/presentation/widgets/category_selection_sheet.dart';
import 'package:mobile/features/resume/data/models/specialization.dart';

class CreateVacancyBasicInfoStep extends HookWidget {
  final TextEditingController titleController;
  final String? selectedSpecialization;
  final ValueChanged<String?> onSpecializationSelected;
  final List<Specialization> specializations;
  final TextEditingController salaryFromController;
  final TextEditingController salaryToController;
  final AppCurrency selectedCurrency;
  final ValueChanged<AppCurrency> onCurrencySelected;
  final TextEditingController contactNameController;
  final TextEditingController contactEmailController;
  final TextEditingController phoneController;
  final EmploymentType selectedJobType;
  final ValueChanged<EmploymentType> onJobTypeSelected;
  final VoidCallback onNext;

  const CreateVacancyBasicInfoStep({
    super.key,
    required this.titleController,
    required this.selectedSpecialization,
    required this.onSpecializationSelected,
    required this.specializations,
    required this.salaryFromController,
    required this.salaryToController,
    required this.selectedCurrency,
    required this.onCurrencySelected,
    required this.contactNameController,
    required this.contactEmailController,
    required this.phoneController,
    required this.selectedJobType,
    required this.onJobTypeSelected,
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
            "auth.complete_profile.title",
            style: context.textThemes.h5,
          ).tr(),
          const SizedBox(height: 20),
          AppInputField(
            label: "postings.create.title".tr(),
            controller: titleController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            validator: AppValidators.required,
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "postings.create.searchPlaceholder".tr(),
            hintText: selectedSpecialization ?? "postings.create.search".tr(),
            readOnly: true,
            suffixIcon: Icon(
              Icons.chevron_right,
              color: context.colors.textSecondary,
            ),
            onTap: () async {
              final result = await showModalBottomSheet<String>(
                context: context,
                isScrollControlled: true,
                backgroundColor: context.colors.bgPrimary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (context) =>
                    CategorySelectionSheet(specializations: specializations),
              );
              if (result != null) {
                onSpecializationSelected(result);
              }
            },
          ),
          const SizedBox(height: 16),
          Text(
            "postings.create.salary".tr(args: ['']),
            style: context.textThemes.s3,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: AppInputField(
                  hintText: "postings.create.all".tr(),
                  controller: salaryFromController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: AppInputField(
                  hintText: "postings.create.all".tr(),
                  controller: salaryToController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: context.colors.bgSecondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<AppCurrency>(
                      value: selectedCurrency,
                      icon: const Icon(Icons.arrow_drop_down, size: 20),
                      isExpanded: true,
                      style: context.textThemes.b2.copyWith(
                        color: context.colors.textPrimary,
                      ),
                      dropdownColor: context.colors.bgPrimary,
                      onChanged: (AppCurrency? newValue) {
                        if (newValue != null) {
                          onCurrencySelected(newValue);
                        }
                      },
                      items: AppCurrency.values
                          .map<DropdownMenuItem<AppCurrency>>((
                            AppCurrency value,
                          ) {
                            return DropdownMenuItem<AppCurrency>(
                              value: value,
                              child: Text(value.name.toUpperCase()),
                            );
                          })
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "postings.fullNameLabel".tr(),
            controller: contactNameController,
            autofillHints: const [AutofillHints.name],
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "postings.create.phoneLabel".tr(),
            controller: phoneController,
            autofillHints: const [AutofillHints.telephoneNumberNational],
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "Email",
            controller: contactEmailController,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            textInputAction: TextInputAction.next,
            validator: (v) => AppValidators.email(v, isRequired: false),
          ),
          const SizedBox(height: 16),
          Text(
            "postings.create.employmentType".tr(),
            style: context.textThemes.s3,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children:
                [
                  EmploymentType.fullTime,
                  EmploymentType.partTime,
                  EmploymentType.contract,
                ].map((type) {
                  final isSelected = selectedJobType == type;
                  return ChoiceChip(
                    label: Text(type.localizedLabel),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) onJobTypeSelected(type);
                    },
                    showCheckmark: false,
                    backgroundColor: context.colors.bgSecondary,
                    selectedColor: context.colors.brandDefault,
                    side: BorderSide(
                      color: isSelected
                          ? context.colors.brandDefault
                          : context.colors.bgSecondary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelStyle: context.textThemes.b3.copyWith(
                      color: isSelected
                          ? context.colors.midnightImmutable
                          : context.colors.textSecondary,
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 32),
          ListenableBuilder(
            listenable: titleController,
            builder: (context, _) {
              return AppButton(
                label: "postings.create.continueButton".tr(),
                enabled: selectedSpecialization != null,
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
