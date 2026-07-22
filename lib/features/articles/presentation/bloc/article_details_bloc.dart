import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/article.dart';
import '../../domain/repositories/articles_repository.dart';

part 'article_details_event.dart';
part 'article_details_state.dart';

@injectable
class ArticleDetailsBloc extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  final ArticlesRepository _repository;

  ArticleDetailsBloc(this._repository) : super(const ArticleDetailsState()) {
    on<LoadArticleDetails>(_onLoad);
    on<ToggleSaveArticle>(_onToggleSave);
  }

  Future<void> _onLoad(
    LoadArticleDetails event,
    Emitter<ArticleDetailsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    // Simulate fetching saved articles to see if this one is saved
    final savedResult = await _repository.getSavedArticles();
    bool isSaved = false;
    savedResult.fold(
      (_) {},
      (savedArticles) {
        isSaved = savedArticles.any((s) => s.articleId.toString() == event.id);
      },
    );

    final result = await _repository.getArticleDetail(event.id);
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (article) {
        // Also view the article
        _repository.viewArticle(event.id);
        emit(state.copyWith(isLoading: false, article: article, isSaved: isSaved));
      },
    );
  }

  Future<void> _onToggleSave(
    ToggleSaveArticle event,
    Emitter<ArticleDetailsState> emit,
  ) async {
    if (state.article == null) return;
    
    final newSaveState = !state.isSaved;
    emit(state.copyWith(isSaved: newSaveState));
    
    final result = newSaveState 
      ? await _repository.saveArticle(state.article!.id.toString())
      : await _repository.unsaveArticle(state.article!.id.toString());
      
    result.fold(
      (failure) {
        // Revert on failure
        emit(state.copyWith(isSaved: !newSaveState, error: failure.message));
      },
      (_) {},
    );
  }
}
