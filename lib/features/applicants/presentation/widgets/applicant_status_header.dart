import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/applicants/data/models/applicant.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicant_detail_bloc.dart';

class ApplicantStatusHeader extends StatelessWidget {
  final Applicant? applicant;
  final String vacancyId;
  final String applicantId;

  const ApplicantStatusHeader({
    super.key,
    this.applicant,
    required this.vacancyId,
    required this.applicantId,
  });

  String _statusLabel(String? status) {
    switch (status) {
      case 'applied':
        return 'applications.status.pending'.tr();
      case 'interview':
        return 'applications.status.interview'.tr();
      case 'offered':
        return 'applicants.invited'.tr();
      case 'rejected':
        return 'applications.status.rejected'.tr();
      case 'hired':
        return 'applications.status.interview'.tr();
      default:
        return status ?? 'Noma\'lum';
    }
  }

  String _formattedDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "applicants.unseen",
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ).tr(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _statusLabel(applicant?.applicationStatus),
                style: context.textThemes.s1,
              ),
              if (applicant?.updatedAt != null)
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 20,
                      color: context.colors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _formattedDate(applicant!.updatedAt),
                      style: context.textThemes.b2.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<ApplicantDetailBloc, ApplicantDetailState>(
            builder: (context, state) {
              return AppButton(
                onTap: () => _showStatusPicker(context),
                enabled: !state.isUpdating,
                color: context.colors.brandProgress,
                foregroundColor: context.colors.brandDefault,
                label: state.isUpdating
                    ? "shared.continue".tr()
                    : "shared.edit".tr(),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showStatusPicker(BuildContext context) {
    final statuses = ['applied', 'interview', 'offered', 'rejected', 'hired'];
    showModalBottomSheet(
      context: context,
      builder: (ctx) => ListView(
        shrinkWrap: true,
        children: statuses
            .map(
              (s) => ListTile(
                title: Text(_statusLabel(s)),
                onTap: () {
                  Navigator.pop(ctx);
                  context.read<ApplicantDetailBloc>().add(
                    UpdateApplicantDetailStatus(
                      vacancyId: vacancyId,
                      applicantId: applicantId,
                      status: s,
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
