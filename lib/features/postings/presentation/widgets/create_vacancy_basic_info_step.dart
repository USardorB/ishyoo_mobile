import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/postings/presentation/widgets/category_selection_sheet.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';
import 'package:mobile/features/resume/data/models/specialization.dart';

class CreateVacancyBasicInfoStep extends StatelessWidget {
  final TextEditingController titleController;
  final String? selectedSpecialization;
  final ValueChanged<String?> onSpecializationSelected;
  final List<Specialization> specializations;
  final TextEditingController addressController;
  final TextEditingController salaryFromController;
  final TextEditingController salaryToController;
  final TextEditingController phoneController;
  final JobType selectedJobType;
  final ValueChanged<JobType> onJobTypeSelected;
  final VoidCallback onNext;

  const CreateVacancyBasicInfoStep({
    super.key,
    required this.titleController,
    required this.selectedSpecialization,
    required this.onSpecializationSelected,
    required this.specializations,
    required this.addressController,
    required this.salaryFromController,
    required this.salaryToController,
    required this.phoneController,
    required this.selectedJobType,
    required this.onJobTypeSelected,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Asosiy ma'lumotlar", style: context.textThemes.h5),
          const SizedBox(height: 20),
          AppInputField(
            label: "VAKANSIYA NOMI",
            controller: titleController,
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "MUTAXASSISLIK",
            hintText: selectedSpecialization ?? "Mutaxassislik tanlang",
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
          AppInputField(
            label: "Manzil",
            controller: addressController,
          ),
          const SizedBox(height: 16),
          Text("MAOSH (SO'M)", style: context.textThemes.s3),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: AppInputField(
                  hintText: "Dan",
                  controller: salaryFromController,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppInputField(
                  hintText: "Gacha",
                  controller: salaryToController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppInputField(
            label: "Telefon",
            controller: phoneController,
          ),
          const SizedBox(height: 16),
          Text("BANDLIK TURI", style: context.textThemes.s3),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children:
                [
                  JobType.fullTime,
                  JobType.partTime,
                  JobType.contract,
                ].map((type) {
                  final isSelected = selectedJobType == type;
                  return ChoiceChip(
                    label: Text(type.title),
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
