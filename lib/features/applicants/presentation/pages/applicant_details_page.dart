import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicant_detail_bloc.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_avatar_info.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_contacts.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_page_more_actions.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_skills.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_status_header.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_work_history.dart';
import 'package:mobile/features/applicants/presentation/widgets/new_applicant_action_buttons.dart';
import 'package:mobile/features/applicants/presentation/widgets/respond_application_sheet.dart';

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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              BlocBuilder<ApplicantDetailBloc, ApplicantDetailState>(
                builder: (context, state) => IconButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const RespondApplicationSheet(),
                  ),
                  icon: const Icon(Icons.share),
                ),
              ),
              IconButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => const ApplicantPageMoreActions(),
                ),
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          body: BlocBuilder<ApplicantDetailBloc, ApplicantDetailState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.error != null && state.applicant == null) {
                return Center(child: Text(state.error!));
              }
              final applicant = state.applicant;
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
                  bottom: 80 + bottom,
                ),
                children: [
                  ApplicantAvatarInfo(applicant: applicant),
                  const SizedBox(height: 16),
                  ApplicantStatusHeader(
                    applicant: applicant,
                    vacancyId: vacancyId,
                    applicantId: applicantResumeId,
                  ),
                  const SizedBox(height: 24),
                  ApplicantContacts(applicant: applicant),
                  const SizedBox(height: 24),
                  ApplicantWorkHistory(
                    experiences: applicant?.experiences ?? [],
                    label: 'Ish tajribasi',
                  ),
                  const SizedBox(height: 24),
                  ApplicantSkills(skills: applicant?.skills ?? []),
                ],
              );
            },
          ),
          bottomSheet: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                .copyWith(
                  bottom: 12 + bottom,
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
