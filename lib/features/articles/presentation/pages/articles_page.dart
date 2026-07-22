import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

import '../bloc/articles_bloc.dart';
import '../widgets/article_item.dart';

@RoutePage()
class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ArticlesBloc>()..add(LoadArticles()),
      child: const _ArticlesPageView(),
    );
  }
}

class _ArticlesPageView extends StatelessWidget {
  const _ArticlesPageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Maqolalar"),
      ),
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state.isLoading && state.articles == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.articles == null) {
            return Center(child: Text(state.error!));
          }

          final articles = state.articles ?? [];

          if (articles.isEmpty) {
            return const Center(child: Text("Hozircha maqolalar yo'q"));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 16,
            ),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ArticleItem(
                article: article,
                onTap: () => context.pushRoute(
                  ArticleDetailsRoute(
                    id: article.id.toString(),
                  ),
                ),
              );
            },
            separatorBuilder: (_, _) => const SizedBox(height: 16),
          );
        },
      ),
    );
  }
}
