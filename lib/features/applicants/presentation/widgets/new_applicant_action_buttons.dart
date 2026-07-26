import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicant_detail_bloc.dart';

class NewApplicantActionButtons extends StatelessWidget {
  final String vacancyId;
  final String applicantId;

  const NewApplicantActionButtons({
    super.key,
    required this.vacancyId,
    required this.applicantId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicantDetailBloc, ApplicantDetailState>(
      builder: (context, state) {
        final isUpdating = state.isUpdating;
        return Row(
          children: [
            Flexible(
              child: AppButton(
                onTap: () {
                  context.read<ApplicantDetailBloc>().add(
                    UpdateApplicantDetailStatus(
                      vacancyId: vacancyId,
                      applicantId: applicantId,
                      status: 'interview',
                    ),
                  );
                },
                enabled: !isUpdating,
                label: "Taklif qilish",
                labelStyle: context.textThemes.b3,
                color: context.colors.brandProgress,
                foregroundColor: context.colors.brandDefault,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: AppButton(
                color: context.colors.bgSecondary,
                onTap: () {
                  context.read<ApplicantDetailBloc>().add(
                    UpdateApplicantDetailStatus(
                      vacancyId: vacancyId,
                      applicantId: applicantId,
                      status: 'rejected',
                    ),
                  );
                },
                enabled: !isUpdating,
                label: "Rad qilish",
                labelStyle: context.textThemes.b3,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 48,
              child: AppButton(
                color: context.colors.bgSecondary,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Chat tez orada qo'shiladi")),
                  );
                },
                icon: Icons.chat,
              ),
            ),
          ],
        );
      },
    );
  }
}
