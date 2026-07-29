import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_contacts_form.dart';
import 'package:mobile/features/resume/presentation/widgets/forms/resume_skills_form.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_education_list_step.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_experience_list_step.dart';

@RoutePage()
class CreateResumeFlowPage extends HookWidget {
  final Resume? resume;

  const CreateResumeFlowPage({super.key, this.resume});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;

    return BlocProvider(
      create: (context) {
        final data = <String, dynamic>{
          'email': user?.email ?? '',
          'phone': user?.phoneNumber ?? '',
        };

        if (resume != null) {
          data.addAll({
            'specialization': resume!.specialization,
            'expected_salary': resume!.expectedSalary?.toString(),
            'experiences':
                resume!.experiences?.map((e) => e.toMap()).toList() ?? [],
            'educations':
                resume!.educations?.map((e) => e.toMap()).toList() ?? [],
            'skills': resume!.skills ?? [],
          });
        }
        return sl<ResumeFormBloc>(param1: data);
      },
      child: _CreateResumeFlowContent(resumeId: resume?.id),
    );
  }
}

class _CreateResumeFlowContent extends HookWidget {
  final String? resumeId;

  const _CreateResumeFlowContent({this.resumeId});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    final titles = [
      "resume.contacts".tr(),
      "resume.workplace".tr(),
      "resume.education".tr(),
      "profile.languages".tr(),
    ];

    void nextStep() {
      if (currentPage.value < 3) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        context.read<ResumeFormBloc>().add(
          SubmitResumeForm(resumeId: resumeId),
        );
      }
    }

    return BlocListener<ResumeFormBloc, ResumeFormState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.pushRoute(const ResumeSuccessRoute());
        } else if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!)),
          );
        }
      },
      child: Scaffold(
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
              BlocBuilder<ResumeFormBloc, ResumeFormState>(
                builder: (context, state) {
                  if (state.isSubmitting && currentPage.value == 3) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    );
                  }
                  return TextButton(
                    onPressed: nextStep,
                    child: Text(
                      "shared.save",
                      style: context.textThemes.b2.copyWith(
                        color: context.colors.brandProgress,
                      ),
                    ).tr(),
                  );
                },
              )
            else
              const SizedBox(width: 48),
            const SizedBox(width: 8),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: _ProgressBar(currentIndex: currentPage.value, totalSteps: 4),
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            currentPage.value = index;
          },
          children: [
            _buildPage(context, const ResumeContactsForm()),
            _buildPage(
              context,
              const ResumeExperienceListStep(),
              showSaveButton: true,
              onSave: nextStep,
            ),
            _buildPage(
              context,
              const ResumeEducationListStep(),
              showSaveButton: true,
              onSave: nextStep,
            ),
            _buildPage(context, const ResumeSkillsForm()),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    Widget form, {
    bool showSaveButton = false,
    VoidCallback? onSave,
  }) {
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
            padding: const EdgeInsets.all(16).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 16,
            ),
            child: AppButton(
              onTap: onSave!,
              label: "shared.save".tr(),
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
                color: isActive
                    ? context.colors.brandProgress
                    : context.colors.bgTertiary,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          );
        }),
      ),
    );
  }
}
