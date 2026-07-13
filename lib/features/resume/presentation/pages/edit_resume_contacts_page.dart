import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_contacts_form.dart';

@RoutePage()
class EditResumeContactsPage extends StatelessWidget {
  const EditResumeContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        title: const Text("Kontaktlar"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: Text(
              "Saqlash",
              style: context.textThemes.b2.copyWith(
                color: context.colors.brandProgress,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: MediaQuery.paddingOf(context).bottom + 24,
        ),
        child: const ResumeContactsForm(),
      ),
    );
  }
}
