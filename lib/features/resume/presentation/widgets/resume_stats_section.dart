import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/app_enums.dart' hide AppNotificationType;
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_detail_bloc.dart';
import 'package:mobile/features/resume/presentation/bloc/resume_form_bloc.dart';

class ResumeStatsSection extends StatelessWidget {
  final Resume resume;

  const ResumeStatsSection({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResumeFormBloc, ResumeFormState>(
      listener: (context, state) {
        if (state.isBoosted) {
          AppNotificationOverlay.instance.show(
            message: "shared.saved_success".tr(),
            type: AppNotificationType.success,
          );
          context.read<ResumeDetailBloc>().add(LoadResumeDetail(resume.id));
        } else if (state.error != null) {
          AppNotificationOverlay.instance.show(
            message: state.error!,
            type: AppNotificationType.error,
          );
        }
      },
      builder: (context, state) {
        final canBoost = resume.availableForBoost == true;
        final isSubmitting = state.isSubmitting;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.bgSecondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat(
                    context,
                    "resume.boost_score".tr(),
                    "${resume.boostScore ?? 0}",
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
                    AppStatus.fromServer(resume.status) == AppStatus.active
                        ? 'shared.all'.tr()
                        : 'shared.cancel'.tr(),
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
                    ResumeVisibility.fromServer(resume.visibility) ==
                            ResumeVisibility.public
                        ? 'shared.all'.tr()
                        : 'shared.cancel'.tr(),
                    false,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AppButton(
                onTap: (canBoost && !isSubmitting)
                    ? () {
                        context.read<ResumeFormBloc>().add(
                          BoostResume(resume.id),
                        );
                      }
                    : () {},
                label: isSubmitting
                    ? "shared.continue".tr()
                    : "shared.save".tr(),
                color: canBoost
                    ? context.colors.brandProgress.withValues(alpha: 0.15)
                    : context.colors.bgTertiary,
                foregroundColor: canBoost
                    ? context.colors.brandProgress
                    : context.colors.textSecondary,
              ),
            ],
          ),
        );
      },
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
