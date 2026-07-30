import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/presentation/bloc/hr_vacancy_details_bloc.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/posting_actions_sheet.dart';

@RoutePage()
class HrVacancyDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  final String id;

  const HrVacancyDetailsPage({super.key, @PathParam('id') required this.id});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HrVacancyDetailsBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "nav.vacancies",
          style: context.textThemes.h4.copyWith(
            color: context.colors.textPrimary,
          ),
        ).tr(),
        actions: [
          IconButton(
            onPressed: () {
              if (state is! HrVacancyDetailsSuccess) return;
              final bloc = context.read<PostingsBloc>();

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => BlocProvider.value(
                  value: bloc,
                  child: PostingActionsSheet(vacancy: state.vacancy),
                ),
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<HrVacancyDetailsBloc, HrVacancyDetailsState>(
        builder: (context, state) {
          if (state is HrVacancyDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HrVacancyDetailsError) {
            return Center(
              child: Text(
                state.message,
                style: context.textThemes.b2.copyWith(
                  color: context.colors.danger,
                ),
              ),
            );
          } else if (state is HrVacancyDetailsSuccess) {
            return _buildContent(context, state.vacancy);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, Vacancy vacancy) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
        bottom: MediaQuery.paddingOf(context).bottom + 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          _buildTopCard(context, vacancy),
          const SizedBox(height: 32),
          if (vacancy.description != null &&
              vacancy.description!.isNotEmpty) ...[
            _buildSectionTitle(context, "opportunities.description".tr()),
            const SizedBox(height: 16),
            Text(
              vacancy.description!,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 32),
          ],
          if (vacancy.requirements != null &&
              vacancy.requirements!.isNotEmpty) ...[
            _buildSectionTitle(context, "opportunities.requirements".tr()),
            const SizedBox(height: 16),
            ...vacancy.requirements!
                .split(RegExp(r'\n|\r\n'))
                .where((s) => s.trim().isNotEmpty)
                .map(
                  (req) => _buildBulletPoint(context, req),
                ),
            const SizedBox(height: 32),
          ],
          if (vacancy.keySkills != null && vacancy.keySkills!.isNotEmpty) ...[
            _buildSectionTitle(context, "postings.key_skills".tr()),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: vacancy.keySkills!
                  .map((skill) => _buildSkillChip(context, skill))
                  .toList(),
            ),
            const SizedBox(height: 32),
          ],
        ],
      ),
    );
  }

  Widget _buildTopCard(BuildContext context, Vacancy vacancy) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vacancy.specialization!,
            style: context.textThemes.h5,
          ),
          const SizedBox(height: 12),
          if (vacancy.salaryFrom != null || vacancy.salaryTo != null)
            Text(
              "${vacancy.salaryFrom?.toInt() ?? 0}–${vacancy.salaryTo?.toInt() ?? 0} ${vacancy.currency ?? "so'm"}",
              style: context.textThemes.h5.copyWith(
                color: context.colors.brandDefault,
              ),
            ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (vacancy.location != null && vacancy.location!.isNotEmpty) ...[
                _buildSmallTag(context, vacancy.location!),
              ],
              if (vacancy.jobType != null && vacancy.jobType!.isNotEmpty) ...[
                _buildSmallTag(
                  context,
                  EmploymentType.fromServer(vacancy.jobType)?.localizedLabel ?? vacancy.jobType!,
                ),
              ],
              if (vacancy.experienceLevel != null &&
                  vacancy.experienceLevel!.isNotEmpty) ...[
                _buildSmallTag(
                  context,
                  AppExperienceLevel.fromServer(vacancy.experienceLevel)?.localizedLabel ?? vacancy.experienceLevel!,
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _getStatusColor(context, vacancy.status),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _getStatusText(vacancy.status),
                style: context.textThemes.b3.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              Text(
                " • ${'postings.responses_count'.tr(args: [vacancy.totalApplicationsCount.toString()])}",
                style: context.textThemes.b3.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallTag(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.bgTertiary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: context.textThemes.buttonMedium.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 4,
          height: 18,
          color: context.colors.brandDefault,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: context.textThemes.s2,
        ),
      ],
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: context.colors.brandDefault,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text.trim(),
              style: context.textThemes.b2.copyWith(height: 1.45),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(8),
      ),
      child: Text(
        skill,
        style: context.textThemes.b3.copyWith(
          color: context.colors.brandDefault,
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(_) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => sl<HrVacancyDetailsBloc>()..add(LoadHrVacancyDetail(id)),
      ),
      BlocProvider.value(value: sl<PostingsBloc>()),
    ],
    child: this,
  );

  Color _getStatusColor(BuildContext context, String? status) {
    final s = VacancyStatus.fromServer(status);
    return switch (s) {
      VacancyStatus.published => context.colors.brandDefault,
      VacancyStatus.confirmed => context.colors.brandDefault,
      VacancyStatus.rejected => context.colors.danger,
      VacancyStatus.draft => context.colors.textSecondary,
      VacancyStatus.archived => context.colors.textSecondary,
      VacancyStatus.closed => context.colors.textSecondary,
      null => context.colors.textSecondary,
    };
  }

  String _getStatusText(String? status) {
    return VacancyStatus.fromServer(status)?.localizedLabel ?? '';
  }
}
