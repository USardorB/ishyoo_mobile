import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/opportunities/presentation/widgets/vacancy_map_placeholder.dart';
import 'package:mobile/features/opportunities/presentation/widgets/apply_vacancy_sheet.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_details_bloc.dart';

@RoutePage()
class VacancyDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  final String id;

  const VacancyDetailsPage({super.key, @PathParam('id') required this.id});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<VacancyDetailsBloc>()..add(LoadVacancyDetails(id)),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VacancyDetailsBloc, VacancyDetailsState>(
      listener: (context, state) {
        if (state is VacancyDetailsLoaded) {
          if (state.applyError != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.applyError!)),
            );
          } else if (state.applySuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Muvaffaqiyatli topshirildi!')),
            );
            context.router.pop(); // Optionally pop back
          }
        } else if (state is VacancyDetailsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is VacancyDetailsLoading || state is VacancyDetailsInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is! VacancyDetailsLoaded) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text("Xatolik yuz berdi")),
          );
        }

        final vacancy = state.vacancy;
        final isSaved = vacancy.hasSaved ?? false;
        final isApplying = state.isApplying;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.router.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(isSaved ? Icons.favorite : Icons.favorite_border,
                    color: isSaved ? Colors.red : null),
                onPressed: () {
                  context.read<VacancyDetailsBloc>().add(
                        ToggleSaveVacancy(
                            id: vacancy.id, currentlySaved: isSaved),
                      );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                .copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: context.colors.bgSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          vacancy.organization?.name.substring(0, 1).toUpperCase() ?? 'O',
                          style: context.textThemes.h3.copyWith(
                            color: context.colors.brandDefault,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vacancy.organization?.name ?? "Tashkilot",
                            style: context.textThemes.s1,
                          ),
                          Text(
                            vacancy.organization?.industry ?? "Tashkilot",
                            style: context.textThemes.b1.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  vacancy.jobTitle,
                  style: context.textThemes.h5,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 8,
                  children: [
                    if (vacancy.location != null)
                      _buildBadge(context, vacancy.location!),
                    if (vacancy.jobType != null)
                      _buildBadge(context, vacancy.jobType!),
                    if (vacancy.experienceLevel != null)
                      _buildBadge(context, vacancy.experienceLevel!),
                  ],
                ),
                const SizedBox(height: 14),
                Divider(
                  color: context.colors.lineSecondary,
                  height: 1,
                  thickness: .5,
                ),
                const SizedBox(height: 16),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.brandProgress,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.people_alt_outlined,
                                size: 20,
                                color: context.colors.brandDefault,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "95 kishi allaqachon javob berdi", // Hardcoded per design
                                  style: context.textThemes.b2.copyWith(
                                    color: context.colors.brandDefault,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.brandProgress,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.visibility_outlined,
                                size: 20,
                                color: context.colors.brandDefault,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  "2 kishi tomosha qilmoqda", // Hardcoded per design
                                  style: context.textThemes.b2.copyWith(
                                    color: context.colors.brandDefault,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                if (vacancy.description != null) ...[
                  Text(
                    "Vakansiya haqida",
                    style: context.textThemes.s2,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    vacancy.description!,
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                if (vacancy.responsibilities != null &&
                    vacancy.responsibilities!.isNotEmpty) ...[
                  Text(
                    "Vazifalar",
                    style: context.textThemes.s2,
                  ),
                  const SizedBox(height: 12),
                  ...vacancy.responsibilities!.split('\n').where((s) => s.trim().isNotEmpty).map(
                    (res) => _buildBulletPoint(context, res),
                  ),
                  const SizedBox(height: 24),
                ],
                if (vacancy.requirements != null &&
                    vacancy.requirements!.isNotEmpty) ...[
                  Text(
                    "Talablar",
                    style: context.textThemes.s2,
                  ),
                  const SizedBox(height: 12),
                  ...vacancy.requirements!.split('\n').where((s) => s.trim().isNotEmpty).map(
                    (req) => _buildBulletPoint(context, req),
                  ),
                  const SizedBox(height: 24),
                ],
                if (vacancy.keySkills != null &&
                    vacancy.keySkills!.isNotEmpty) ...[
                  Text(
                    "Asosiy ko'nikmalar",
                    style: context.textThemes.s2,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: vacancy.keySkills!
                        .map((skill) => _buildSkillChip(context, skill))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                ],
                Text(
                  "Xaritada",
                  style: context.textThemes.s2,
                ),
                const SizedBox(height: 12),
                const VacancyMapPlaceholder(),
              ],
            ),
          ),
          bottomSheet: Container(
            color: context.colors.bgPrimary,
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 12,
            ),
            child: AppButton(
              onTap: () {
                if (vacancy.hasApplied == true) return;
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => ApplyVacancySheet(
                    onApply: (resumeId, coverLetter) {
                      context.read<VacancyDetailsBloc>().add(
                            ApplyToVacancy(vacancy.id, resumeId, coverLetter),
                          );
                    },
                  ),
                );
              },
              isLoading: isApplying,
              label: vacancy.hasApplied == true ? "Javob berilgan" : "Javob qaytarish",
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadge(BuildContext context, String text) {
    return Container(
      padding: const .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(6),
      ),
      child: Text(
        text,
        style: context.textThemes.b2.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: context.colors.brandDefault,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String text) {
    return Container(
      padding: const .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(6),
      ),
      child: Text(
        text,
        style: context.textThemes.b2.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
