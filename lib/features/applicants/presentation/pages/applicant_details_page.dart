import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_notification.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicant_detail_bloc.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_avatar_info.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_contacts.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_page_more_actions.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_skills.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_status_header.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_work_history.dart';
import 'package:mobile/features/applicants/presentation/widgets/new_applicant_action_buttons.dart';

@RoutePage()
class ApplicantDetailsPage extends StatelessWidget {
  final String vacancyId;
  final String applicantResumeId;

  const ApplicantDetailsPage({
    super.key,
    required this.vacancyId,
    required this.applicantResumeId,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = Platform.isIOS ? 12.0 : MediaQuery.paddingOf(context).bottom;

    return BlocProvider(
      create: (_) => sl<ApplicantDetailBloc>()
        ..add(
          LoadApplicantDetail(
            vacancyId: vacancyId,
            applicantId: applicantResumeId,
          ),
        ),
      child: BlocListener<ApplicantDetailBloc, ApplicantDetailState>(
        listener: (context, state) {
          if (state.error != null) {
            AppNotificationOverlay.instance.show(
              message: state.error!,
              type: AppNotificationType.error,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  AppNotificationOverlay.instance.show(
                    message: "applicants.comingSoon".tr(),
                    type: AppNotificationType.warning,
                  );
                },
                icon: const Icon(Icons.share_outlined),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const ApplicantPageMoreActions(),
                  );
                },
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
          body: BlocBuilder<ApplicantDetailBloc, ApplicantDetailState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final applicant = state.applicant;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                  bottom: bottom + 90,
                ),
                child: Column(
                  children: [
                    ApplicantAvatarInfo(applicant: applicant),
                    const SizedBox(height: 24),
                    ApplicantStatusHeader(
                      applicant: applicant,
                      vacancyId: vacancyId,
                      applicantId: applicantResumeId,
                    ),
                    const SizedBox(height: 24),
                    ApplicantSkills(skills: applicant?.skills ?? []),
                    const SizedBox(height: 24),
                    ApplicantWorkHistory(
                      experiences: applicant?.experiences ?? [],
                    ),
                    const SizedBox(height: 24),
                    ApplicantContacts(applicant: applicant),
                  ],
                ),
              );
            },
          ),
          bottomSheet: Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: bottom + 12,
            ),
            child: NewApplicantActionButtons(
              vacancyId: vacancyId,
              applicantId: applicantResumeId,
            ),
          ),
        ),
      ),
    );
  }
}
