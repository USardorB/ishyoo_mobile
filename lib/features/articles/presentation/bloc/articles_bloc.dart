import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/article.dart';
import '../../domain/repositories/articles_repository.dart';

part 'articles_event.dart';
part 'articles_state.dart';

@injectable
class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesRepository _repository;

  ArticlesBloc(this._repository) : super(const ArticlesState()) {
    on<LoadArticles>(_onLoadArticles);
  }

  Future<void> _onLoadArticles(
    LoadArticles event,
    Emitter<ArticlesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repository.getArticles();
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (articles) => emit(state.copyWith(isLoading: false, articles: articles)),
    );
  }
}
