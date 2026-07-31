import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';

class CreateVacancySummaryStep extends StatelessWidget {
  final String title;
  final EmploymentType jobType;
  final AppExperienceLevel experience;
  final String description;
  final String? salaryFrom;
  final String? salaryTo;
  final AppCurrency currency;
  final String location;
  final VoidCallback onEditBasicInfo;
  final VoidCallback onEditRequirements;
  final VoidCallback onPost;
  final VoidCallback onSaveDraft;

  const CreateVacancySummaryStep({
    super.key,
    required this.title,
    required this.jobType,
    required this.experience,
    required this.description,
    this.salaryFrom,
    this.salaryTo,
    required this.currency,
    required this.location,
    required this.onEditBasicInfo,
    required this.onEditRequirements,
    required this.onPost,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("shared.saved_success", style: context.textThemes.h5).tr(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.bgSecondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<
                  EmployerOrganizationBloc,
                  EmployerOrganizationState
                >(
                  builder: (context, state) {
                    final org = state.organization;
                    final logoUrl = org?.logo;
                    final orgName = org?.name ?? 'Company';
                    final firstLetter = orgName.isNotEmpty
                        ? orgName[0].toUpperCase()
                        : 'C';

                    return Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: context.colors.brandDefault,
                            borderRadius: BorderRadius.circular(8),
                            image: logoUrl != null && logoUrl.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(logoUrl),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: logoUrl == null || logoUrl.isEmpty
                              ? Center(
                                  child: Text(
                                    firstLetter,
                                    style: context.textThemes.h5.copyWith(
                                      color: context.colors.midnightImmutable,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            orgName,
                            style: context.textThemes.b2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  title.isEmpty ? 'opportunities.title'.tr() : title,
                  style: context.textThemes.h4,
                ),
                const SizedBox(height: 4),
                if ((salaryFrom != null && salaryFrom!.isNotEmpty) ||
                    (salaryTo != null && salaryTo!.isNotEmpty))
                  Text(
                    "${salaryFrom?.isNotEmpty == true ? salaryFrom : '0'}–${salaryTo?.isNotEmpty == true ? salaryTo : '0'} ${currency.name.toUpperCase()}",
                    style: context.textThemes.h5.copyWith(
                      color: context.colors.brandDefault,
                    ),
                  ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildSmallTag(
                      context,
                      location.isEmpty
                          ? 'opportunities.location'.tr()
                          : location,
                    ),
                    _buildSmallTag(context, jobType.label.tr()),
                    _buildSmallTag(context, experience.label.tr()),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  description.replaceAll('\n', ' '),
                  style: context.textThemes.b3.copyWith(
                    color: context.colors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: Icon(
              Icons.edit_outlined,
              color: context.colors.brandDefault,
            ),
            title: Text(
              "profile.edit_profile",
              style: context.textThemes.s2.copyWith(
                color: context.colors.brandDefault,
              ),
            ).tr(),
            onTap: onEditBasicInfo,
            contentPadding: EdgeInsets.zero,
          ),
          ListTile(
            leading: Icon(
              Icons.edit_outlined,
              color: context.colors.brandDefault,
            ),
            title: Text(
              "opportunities.edit_vacancy",
              style: context.textThemes.s2.copyWith(
                color: context.colors.brandDefault,
              ),
            ).tr(),
            onTap: onEditRequirements,
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 40),
          AppButton(
            label: "opportunities.create_vacancy".tr(),
            onTap: onPost,
          ),
          const SizedBox(height: 12),
          AppButton(
            label: "shared.save".tr(),
            color: context.colors.bgSecondary,
            foregroundColor: context.colors.textPrimary,
            onTap: onSaveDraft,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSmallTag(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.bgTertiary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: context.textThemes.b3),
    );
  }
}
