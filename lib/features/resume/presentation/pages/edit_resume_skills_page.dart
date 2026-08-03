import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_skills_form.dart';

@RoutePage()
class EditResumeSkillsPage extends StatelessWidget {
  const EditResumeSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.maybePop(),
        ),
        title: const Text("resume.sections.languages").tr(),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: Text(
              "shared.save",
              style: context.textThemes.b2.copyWith(
                color: context.colors.brandProgress,
              ),
            ).tr(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: MediaQuery.paddingOf(context).bottom + 24,
        ),
        child: const ResumeSkillsForm(),
      ),
    );
  }
}
