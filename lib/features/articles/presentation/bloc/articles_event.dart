part of 'articles_bloc.dart';

sealed class ArticlesEvent {
  const ArticlesEvent();
}

class LoadArticles extends ArticlesEvent {}
