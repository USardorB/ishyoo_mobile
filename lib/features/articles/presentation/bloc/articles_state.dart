part of 'articles_bloc.dart';

class ArticlesState {
  final bool isLoading;
  final List<Article>? articles;
  final String? error;

  const ArticlesState({
    this.isLoading = false,
    this.articles,
    this.error,
  });

  ArticlesState copyWith({
    bool? isLoading,
    List<Article>? articles,
    String? error,
  }) {
    return ArticlesState(
      isLoading: isLoading ?? this.isLoading,
      articles: articles ?? this.articles,
      error: error,
    );
  }
}
