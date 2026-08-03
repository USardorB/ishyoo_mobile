import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/hr_vacancy_card.dart';

@RoutePage()
class MyVacanciesPage extends StatefulWidget {
  const MyVacanciesPage({super.key});

  @override
  State<MyVacanciesPage> createState() => _MyVacanciesPageState();
}

class _MyVacanciesPageState extends State<MyVacanciesPage> {
  final ScrollController _scrollController = ScrollController();
  late final PostingsBloc _postingsBloc;

  @override
  void initState() {
    super.initState();
    _postingsBloc = sl<PostingsBloc>()..add(LoadPostings());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _postingsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'postings.activeVacancies',
            style: context.textThemes.h5,
          ).tr(),
          centerTitle: false,
          elevation: 0,
        ),
        body: BlocBuilder<PostingsBloc, PostingsState>(
          builder: (context, state) {
            if (state.isLoading &&
                (state.vacancies == null || state.vacancies!.isEmpty)) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null &&
                (state.vacancies == null || state.vacancies!.isEmpty)) {
              return Center(
                child: Text(
                  state.error!,
                  style: context.textThemes.b2.copyWith(color: Colors.red),
                ),
              );
            }

            final vacancies = state.vacancies ?? <Vacancy>[];

            if (vacancies.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PostingsBloc>().add(LoadPostings());
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 150,
                    alignment: Alignment.center,
                    child: Text(
                      "postings.emptyState",
                      style: context.textThemes.b2.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ).tr(),
                  ),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostingsBloc>().add(LoadPostings());
              },
              child: ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ).copyWith(bottom: MediaQuery.paddingOf(context).bottom + 16),
                itemCount: vacancies.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return HrVacancyCard(vacancy: vacancies[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
