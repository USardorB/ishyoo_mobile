import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../models/article.dart';

part 'articles_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class ArticlesRemoteDataSource {
  @factoryMethod
  factory ArticlesRemoteDataSource(Dio dio) = _ArticlesRemoteDataSource;

  @GET('/mobile/candidate/article')
  Future<BaseResult<List<Article>>> getArticles();

  @GET('/mobile/candidate/article/{id}')
  Future<BaseResult<Article>> getArticleDetail(@Path('id') String id);

  @POST('/mobile/candidate/article/{id}/view')
  Future<BaseResult<dynamic>> viewArticle(@Path('id') String id);

  @GET('/mobile/candidate/article/saved')
  Future<BaseResult<List<SavedArticle>>> getSavedArticles();

  @GET('/mobile/candidate/article/{id}/save')
  Future<BaseResult<dynamic>> saveArticle(@Path('id') String id);

  @DELETE('/mobile/candidate/article/{id}/save')
  Future<BaseResult<dynamic>> unsaveArticle(@Path('id') String id);
}
