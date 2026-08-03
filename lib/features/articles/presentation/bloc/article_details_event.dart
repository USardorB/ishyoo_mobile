part of 'article_details_bloc.dart';

sealed class ArticleDetailsEvent {
  const ArticleDetailsEvent();
}

class LoadArticleDetails extends ArticleDetailsEvent {
  final String id;
  const LoadArticleDetails(this.id);
}

class ToggleSaveArticle extends ArticleDetailsEvent {}
