import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/profile/presentation/widgets/delete_education_dialog.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_education_form.dart';

@RoutePage()
class EditResumeEducationPage extends HookWidget {
  final ResumeEducation? education;

  const EditResumeEducationPage({super.key, this.education});

  @override
  Widget build(BuildContext context) {
    final schoolController = useTextEditingController(
      text: education?.school ?? "",
    );
    final degreeController = useTextEditingController(
      text: education?.degree ?? "",
    );
    final startYearController = useTextEditingController(
      text: education?.startDate != null
          ? education!.startDate!.year.toString()
          : "",
    );
    final endYearController = useTextEditingController(
      text: education?.endDate != null
          ? education!.endDate!.year.toString()
          : "",
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        title: const Text("resume.sections.education").tr(),
        centerTitle: true,
        actions: [
          if (education != null)
            IconButton(
              onPressed: () async {
                final deleted = await showDialog(
                  context: context,
                  builder: (context) => const DeleteEducationDialog(),
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
              child: ResumeEducationForm(
                schoolController: schoolController,
                degreeController: degreeController,
                startYearController: startYearController,
                endYearController: endYearController,
                showSaveButton: true,
                onSave: () {
                  final startYear = int.tryParse(startYearController.text);
                  final endYear = int.tryParse(endYearController.text);

                  final result = {
                    'action': 'save',
                    'school': schoolController.text,
                    'degree': degreeController.text,
                    'start_date': startYear != null
                        ? DateTime(startYear).toIso8601String()
                        : null,
                    'end_date': endYear != null
                        ? DateTime(endYear).toIso8601String()
                        : null,
                  };
                  context.maybePop(result);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
