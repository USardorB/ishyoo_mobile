import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_education_form.dart';
import 'package:mobile/features/profile/presentation/widgets/delete_education_dialog.dart';

@RoutePage()
class EditResumeEducationPage extends StatelessWidget {
  const EditResumeEducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        title: const Text("O'quv muassasasi"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final deleted = await showDialog(
                context: context,
                builder: (context) => const DeleteEducationDialog(),
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
              child: ResumeEducationForm(
                showSaveButton: true,
                onSave: () => context.maybePop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
