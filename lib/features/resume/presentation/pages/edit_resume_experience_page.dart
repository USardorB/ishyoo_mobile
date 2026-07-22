import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_experience_form.dart';
import 'package:mobile/features/profile/presentation/widgets/delete_experience_dialog.dart';
import 'package:mobile/features/profile/presentation/widgets/month_picker_sheet.dart';

import 'package:mobile/features/location/data/models/region.dart';
import 'package:mobile/features/location/data/models/district.dart';
import 'package:mobile/features/location/presentation/widgets/regions_sheet.dart';
import 'package:mobile/features/location/presentation/widgets/districts_sheet.dart';

@RoutePage()
class EditResumeExperiencePage extends HookWidget {
  final ResumeExperience? experience;

  const EditResumeExperiencePage({super.key, this.experience});

  @override
  Widget build(BuildContext context) {
    final companyController = useTextEditingController(text: experience?.companyName ?? "");
    final positionController = useTextEditingController(text: experience?.position ?? "");
    final descriptionController = useTextEditingController(text: experience?.description ?? "");
    final startDate = useState<DateTime?>(experience?.startDate);
    final endDate = useState<DateTime?>(experience?.endDate);
    final isWorking = useState<bool>(experience != null && experience!.endDate == null);
    final locationStr = useState<String>("Tanlang");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        title: const Text("Ish joyi"),
        centerTitle: true,
        actions: [
          if (experience != null)
            IconButton(
              onPressed: () async {
                final deleted = await showDialog(
                  context: context,
                  builder: (context) => const DeleteExperienceDialog(),
                );
                if (deleted == true && context.mounted) {
                  context.maybePop({'action': 'delete'});
                }
              },
              icon: Icon(Icons.delete_outline, color: context.colors.danger),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ResumeExperienceForm(
                companyController: companyController,
                positionController: positionController,
                descriptionController: descriptionController,
                location: locationStr.value,
                startDate: startDate.value,
                endDate: endDate.value,
                isWorking: isWorking.value,
                onWorkingChanged: (val) {
                  isWorking.value = val;
                  if (val) endDate.value = null;
                },
                onLocationTapped: () async {
                  final region = await showModalBottomSheet<Region>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const RegionsSheet(),
                  );
                  if (region != null && context.mounted) {
                    final district = await showModalBottomSheet<District>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => DistrictsSheet(regionId: region.id),
                    );
                    if (district != null) {
                      locationStr.value = "${region.nameUz ?? region.name ?? ''}, ${district.nameUz ?? district.name ?? ''}";
                    } else {
                      locationStr.value = region.nameUz ?? region.name ?? '';
                    }
                  }
                },
                onStartMonthTapped: () async {
                  final DateTime? picked = await showModalBottomSheet<DateTime>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => MonthPickerSheet(initialDate: startDate.value),
                  );
                  if (picked != null) {
                    startDate.value = DateTime(picked.year, picked.month, 1);
                  }
                },
                onEndMonthTapped: () async {
                  final DateTime? picked = await showModalBottomSheet<DateTime>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => MonthPickerSheet(initialDate: endDate.value),
                  );
                  if (picked != null) {
                    endDate.value = DateTime(picked.year, picked.month, 1);
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 16,
            ),
            child: AppButton(
              onTap: () {
                final result = {
                  'action': 'save',
                  'company_name': companyController.text,
                  'position': positionController.text,
                  'location': locationStr.value,
                  'description': descriptionController.text,
                  'start_date': startDate.value?.toIso8601String(),
                  'end_date': isWorking.value ? null : endDate.value?.toIso8601String(),
                };
                context.maybePop(result);
              },
              label: "Saqlash",
              color: context.colors.brandProgress,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
