import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  const ApplicantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottom = Platform.isIOS ? 12.0 : MediaQuery.paddingOf(context).bottom;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => RespondApplicationSheet(),
            ),
            icon: Icon(Icons.share),
          ),
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => ApplicantPageMoreActions(),
            ),
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
          bottom: 80 + bottom,
        ),
        children: [
          ApplicantAvatarInfo(),
          SizedBox(height: 16),
          ApplicantStatusHeader(),
          SizedBox(height: 24),
          ApplicantContacts(),
          SizedBox(height: 24),
          ApplicantWorkHistory(),
          SizedBox(height: 24),
          ApplicantWorkHistory(),
          SizedBox(height: 24),
          ApplicantSkills(),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(
          bottom: 12 + bottom,
        ),
        child: NewApplicantActionButtons(),
      ),
    );
  }
}
