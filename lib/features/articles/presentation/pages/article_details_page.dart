import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

import '../bloc/article_details_bloc.dart';

@RoutePage()
class ArticleDetailsPage extends StatelessWidget {
  final String id;

  const ArticleDetailsPage({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ArticleDetailsBloc>()..add(LoadArticleDetails(id)),
      child: const _ArticleDetailsPageView(),
    );
  }
}

class _ArticleDetailsPageView extends StatelessWidget {
  const _ArticleDetailsPageView();

  @override
  Widget build(BuildContext context) {
    final state = context.read<ArticleDetailsBloc>().state;
    final article = state.article;
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (article != null)
            IconButton(
              onPressed: () {
                context.read<ArticleDetailsBloc>().add(ToggleSaveArticle());
              },
              icon: Icon(
                state.isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: state.isSaved ? context.colors.brandDefault : null,
              ),
            ),
        ],
      ),
      body: Builder(
        builder: (context) {
          if (state.isLoading && article == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null && article == null) {
            return Center(child: Text(state.error!));
          }

          if (article == null) {
            return Center(child: const Text("articles.no_articles_found").tr());
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16).copyWith(
              bottom: MediaQuery.paddingOf(context).bottom + 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (article.coverImage != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      article.coverImage!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const SizedBox.shrink(),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.brandProgress,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "articles.title",
                        style: context.textThemes.buttonSmall.copyWith(
                          color: context.colors.brandDefault,
                        ),
                      ).tr(),
                    ),
                    const Spacer(),
                    if (article.createdAt != null)
                      Text(
                        "${article.createdAt!.day}.${article.createdAt!.month}.${article.createdAt!.year}",
                        style: context.textThemes.c1.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  article.title ?? '',
                  style: context.textThemes.s2,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 18,
                      color: context.colors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${article.viewsCount ?? 0}",
                      style: context.textThemes.c1.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.access_time,
                      size: 18,
                      color: context.colors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${article.readTimeMinutes ?? 1} m",
                      style: context.textThemes.c1.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (article.content != null)
                  Html(
                    data: article.content!,
                    style: {
                      "body": Style(
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        lineHeight: const LineHeight(1.25),
                        fontSize: FontSize(14),
                        color: context.colors.textSecondary,
                      ),
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
