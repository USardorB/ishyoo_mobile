import 'package:dart_mappable/dart_mappable.dart';

part 'article.mapper.dart';

@MappableClass()
class Article with ArticleMappable {
  final String id;
  final String? title;
  final String? slug;
  final String? content;
  @MappableField(key: 'cover_image')
  final String? coverImage;
  final String? status;
  @MappableField(key: 'read_time_minutes')
  final int? readTimeMinutes;
  @MappableField(key: 'views_count')
  final int? viewsCount;
  @MappableField(key: 'published_at')
  final DateTime? publishedAt;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;

  Article({
    required this.id,
    this.title,
    this.slug,
    this.content,
    this.coverImage,
    this.status,
    this.readTimeMinutes,
    this.viewsCount,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      ArticleMapper.fromMap(json);
}

@MappableClass()
class SavedArticle with SavedArticleMappable {
  final String id;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'user_id')
  final String? userId;
  @MappableField(key: 'article_id')
  final String? articleId;
  final Article? article;

  SavedArticle({
    required this.id,
    this.createdAt,
    this.userId,
    this.articleId,
    this.article,
  });

  factory SavedArticle.fromJson(Map<String, dynamic> json) =>
      SavedArticleMapper.fromMap(json);
}
