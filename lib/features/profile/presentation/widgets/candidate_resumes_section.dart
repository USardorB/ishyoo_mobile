import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/data/models/resume.dart';

// TODO mock data removal
class CandidateResumesSection extends StatelessWidget {
  final List<Resume> resumes;

  const CandidateResumesSection({super.key, required this.resumes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (resumes.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Text("profile.no_resumes").tr(),
          )
        else
          ...resumes.map(
            (resume) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => context.pushRoute(
                  ResumeDetailsRoute(id: resume.id),
                ),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.bgTertiary),
                    color: context.colors.bgPrimary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  resume.specialization ?? "",
                                  style: context.textThemes.s1,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  resume.updatedAt != null
                                      ? resume.updatedAt!.toString().substring(
                                          0,
                                          10,
                                        )
                                      : "",
                                  style: context.textThemes.b1.copyWith(
                                    color: context.colors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          if (resume.isPrimary == true)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.brandProgress.withValues(
                                  alpha: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "shared.all",
                                style: context.textThemes.c2.copyWith(
                                  color: context.colors.brandProgress,
                                ),
                              ).tr(),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: context.colors.bgSecondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStat(
                              context,
                              "applicants.view_count".tr(),
                              "0",
                              false,
                            ),
                            Container(
                              width: 1,
                              height: 32,
                              color: context.colors.bgTertiary,
                            ),
                            _buildStat(
                              context,
                              "applicants.shortlisted".tr(),
                              "0",
                              true,
                            ),
                            Container(
                              width: 1,
                              height: 32,
                              color: context.colors.bgTertiary,
                            ),
                            _buildStat(
                              context,
                              "applicants.invited".tr(),
                              "0",
                              true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(height: 12),
        AppButton(
          onTap: () {
            context.pushRoute(CreateResumeFlowRoute());
          },
          icon: Icons.add,
          label: "resume.create_resume".tr(),
          color: context.colors.bgSecondary,
          foregroundColor: context.colors.brandDefault,
          labelStyle: context.textThemes.b2.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildStat(
    BuildContext context,
    String label,
    String value,
    bool isHighlighted,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: context.textThemes.c2.copyWith(
            color: isHighlighted
                ? context.colors.info
                : context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.textThemes.s1.copyWith(
            color: isHighlighted
                ? context.colors.info
                : context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
