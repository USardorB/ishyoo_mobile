import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
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
      backgroundColor: context.colors.bgPrimary,
      appBar: AppBar(
        backgroundColor: context.colors.bgPrimary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colors.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "Vakansiya",
          style: context.textThemes.h4.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
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
      padding: EdgeInsets.symmetric(horizontal: 16).copyWith(
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
            _buildSectionTitle(context, "Vakansiya haqida"),
            const SizedBox(height: 16),
            Text(
              vacancy.description!,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
          ],
          if (vacancy.responsibilities != null &&
              vacancy.responsibilities!.isNotEmpty) ...[
            _buildSectionTitle(context, "Vazifalar"),
            const SizedBox(height: 16),
            ...vacancy.responsibilities!
                .split(RegExp(r'\n|\r\n'))
                .where((s) => s.trim().isNotEmpty)
                .map(
                  (res) => _buildBulletPoint(context, res),
                ),
            const SizedBox(height: 32),
          ],
          if (vacancy.requirements != null &&
              vacancy.requirements!.isNotEmpty) ...[
            _buildSectionTitle(context, "Talablar"),
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
            _buildSectionTitle(context, "Ko'nikmalar"),
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
            vacancy.jobTitle,
            style: context.textThemes.h3,
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
          Row(
            children: [
              if (vacancy.location != null && vacancy.location!.isNotEmpty) ...[
                _buildSmallTag(context, vacancy.location!),
                const SizedBox(width: 8),
              ],
              if (vacancy.jobType != null && vacancy.jobType!.isNotEmpty) ...[
                _buildSmallTag(context, vacancy.jobType!),
                const SizedBox(width: 8),
              ],
              if (vacancy.experienceLevel != null &&
                  vacancy.experienceLevel!.isNotEmpty) ...[
                _buildSmallTag(context, vacancy.experienceLevel!),
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
                style: context.textThemes.b3.copyWith(color: context.colors.textSecondary),
              ),
              Text(
                " • ${vacancy.totalApplicationsCount} javob",
                style: context.textThemes.b3.copyWith(color: context.colors.textSecondary),
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
      child: Text(text, style: context.textThemes.b3),
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
          style: context.textThemes.h4,
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
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(8),
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
    switch (status) {
      case 'published':
        return context.colors.brandDefault;
      case 'draft':
      case 'archived':
        return context.colors.textSecondary;
      case 'rejected':
        return context.colors.danger;
      default:
        return context.colors.textSecondary;
    }
  }

  String _getStatusText(String? status) {
    switch (status) {
      case 'published':
        return "E'lon faol";
      case 'draft':
        return "Qoralama";
      case 'archived':
        return "Arxivlangan";
      case 'rejected':
        return "Rad etilgan";
      default:
        return "Noma'lum";
    }
  }
}
