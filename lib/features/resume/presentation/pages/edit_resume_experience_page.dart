import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_experience_form.dart';
import 'package:mobile/features/profile/presentation/widgets/delete_experience_dialog.dart';
import 'package:mobile/features/profile/presentation/widgets/month_picker_sheet.dart';

@RoutePage()
class EditResumeExperiencePage extends StatelessWidget {
  const EditResumeExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        title: const Text("Ish joyi"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final deleted = await showDialog(
                context: context,
                builder: (context) => const DeleteExperienceDialog(),
              );
              if (deleted == true && context.mounted) {
                context.maybePop();
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
                onMonthTapped: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const MonthPickerSheet(),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 16,
            ),
            child: AppButton(
              onTap: () => context.maybePop(),
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
