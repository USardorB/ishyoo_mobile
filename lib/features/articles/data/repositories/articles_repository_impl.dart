import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/articles_repository.dart';
import '../datasources/articles_remote_data_source.dart';
import '../models/article.dart';

@LazySingleton(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesRemoteDataSource remoteDataSource;

  ArticlesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Article>>> getArticles() {
    return remoteDataSource.getArticles().asEither();
  }

  @override
  Future<Either<Failure, Article>> getArticleDetail(String id) {
    return remoteDataSource.getArticleDetail(id).asEither();
  }

  @override
  Future<Either<Failure, Unit>> viewArticle(String id) {
    return remoteDataSource.viewArticle(id).asEither();
  }

  @override
  Future<Either<Failure, List<SavedArticle>>> getSavedArticles() {
    return remoteDataSource.getSavedArticles().asEither();
  }

  @override
  Future<Either<Failure, Unit>> saveArticle(String id) {
    return remoteDataSource.saveArticle(id).asEither();
  }

  @override
  Future<Either<Failure, Unit>> unsaveArticle(String id) {
    return remoteDataSource.unsaveArticle(id).asEither();
  }
}
