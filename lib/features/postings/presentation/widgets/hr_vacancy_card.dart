import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/posting_actions_sheet.dart';

class HrVacancyCard extends StatelessWidget {
  final Vacancy vacancy;

  const HrVacancyCard({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.bgPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.pushRoute(HrVacancyDetailsRoute(id: vacancy.id)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Row(
                  spacing: 8,
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 8,
                            children: [
                              if (vacancy.location != null &&
                                  vacancy.location!.isNotEmpty)
                                _buildTag(context, vacancy.location!),
                              if (vacancy.jobType != null &&
                                  vacancy.jobType!.isNotEmpty)
                                _buildTag(context, vacancy.jobType!),
                              if (vacancy.experienceLevel != null &&
                                  vacancy.experienceLevel!.isNotEmpty)
                                _buildTag(context, vacancy.experienceLevel!),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final bloc = context.read<PostingsBloc>();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => BlocProvider.value(
                            value: bloc,
                            child: PostingActionsSheet(vacancy: vacancy),
                          ),
                        );
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                vacancy.jobTitle,
                style: context.textThemes.s1,
              ),
              Divider(
                thickness: .5,
                height: 25,
                color: context.colors.textSecondary,
              ),
              Row(
                children: [
                  if (vacancy.salaryFrom != null)
                    Text(
                      "${vacancy.salaryFrom!.toInt()} ${vacancy.currency ?? "so'm"}",
                      style: context.textThemes.s2.copyWith(
                        color: context.colors.brandDefault,
                      ),
                    ),
                  const Spacer(),
                  if (vacancy.createdAt != null)
                    Row(
                      spacing: 6,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 20,
                          color: context.colors.textSecondary,
                        ),
                        Text(
                          "${vacancy.createdAt!.year}-${vacancy.createdAt!.month.toString().padLeft(2, '0')}-${vacancy.createdAt!.day.toString().padLeft(2, '0')}",
                          style: context.textThemes.b2.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              // Analytics blocks are skipped for now
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: context.colors.bgSecondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(text, style: context.textThemes.b3),
      ),
    );
  }
}
