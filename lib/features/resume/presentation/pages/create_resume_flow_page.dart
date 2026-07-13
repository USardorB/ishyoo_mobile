import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_contacts_form.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_education_list_step.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_experience_list_step.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_skills_form.dart';

@RoutePage()
class CreateResumeFlowPage extends HookWidget {
  const CreateResumeFlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    final titles = ["Kontaktlar", "Ish joyi", "O'quv muassasasi", "Ko'nikmalar"];
    
    void nextStep() {
      if (currentPage.value < 3) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        context.pushRoute(const ResumeSuccessRoute());
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (currentPage.value > 0) {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              context.maybePop();
            }
          },
        ),
        title: Text(titles[currentPage.value]),
        centerTitle: true,
        actions: [
          if (currentPage.value == 0 || currentPage.value == 3)
            TextButton(
              onPressed: nextStep,
              child: Text(
                "Saqlash",
                style: context.textThemes.b2.copyWith(
                  color: context.colors.brandProgress,
                ),
              ),
            )
          else
            const SizedBox(width: 48), // Balance the back button spacing
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: _ProgressBar(currentIndex: currentPage.value, totalSteps: 4),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        onPageChanged: (index) {
          currentPage.value = index;
        },
        children: [
          _buildPage(context, const ResumeContactsForm()),
          _buildPage(context, const ResumeExperienceListStep(), showSaveButton: true, onSave: nextStep),
          _buildPage(context, const ResumeEducationListStep(), showSaveButton: true, onSave: nextStep),
          _buildPage(context, const ResumeSkillsForm()),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context, Widget form, {bool showSaveButton = false, VoidCallback? onSave}) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: form,
          ),
        ),
        if (showSaveButton)
          Padding(
            padding: EdgeInsets.all(16).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 16,
            ),
            child: AppButton(
              onTap: onSave!,
              label: "Saqlash",
              color: context.colors.brandProgress,
              foregroundColor: Colors.black,
            ),
          ),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final int currentIndex;
  final int totalSteps;

  const _ProgressBar({required this.currentIndex, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: List.generate(totalSteps, (index) {
          final isActive = index <= currentIndex;
          return Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: isActive ? context.colors.brandProgress : context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          );
        }),
      ),
    );
  }
}
