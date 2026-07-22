import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/article.dart';

abstract class ArticlesRepository {
  Future<Either<Failure, List<Article>>> getArticles();
  Future<Either<Failure, Article>> getArticleDetail(String id);
  Future<Either<Failure, Unit>> viewArticle(String id);
  Future<Either<Failure, List<SavedArticle>>> getSavedArticles();
  Future<Either<Failure, Unit>> saveArticle(String id);
  Future<Either<Failure, Unit>> unsaveArticle(String id);
}
