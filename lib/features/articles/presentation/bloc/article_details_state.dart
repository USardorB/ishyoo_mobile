part of 'article_details_bloc.dart';

class ArticleDetailsState {
  final bool isLoading;
  final Article? article;
  final bool isSaved;
  final String? error;

  const ArticleDetailsState({
    this.isLoading = false,
    this.article,
    this.isSaved = false,
    this.error,
  });

  ArticleDetailsState copyWith({
    bool? isLoading,
    Article? article,
    bool? isSaved,
    String? error,
  }) {
    return ArticleDetailsState(
      isLoading: isLoading ?? this.isLoading,
      article: article ?? this.article,
      isSaved: isSaved ?? this.isSaved,
      error: error,
    );
  }
}
