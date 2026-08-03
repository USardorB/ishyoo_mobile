// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'article.dart';

class ArticleMapper extends ClassMapperBase<Article> {
  ArticleMapper._();

  static ArticleMapper? _instance;
  static ArticleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArticleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Article';

  static String _$id(Article v) => v.id;
  static const Field<Article, String> _f$id = Field('id', _$id);
  static String? _$title(Article v) => v.title;
  static const Field<Article, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );
  static String? _$slug(Article v) => v.slug;
  static const Field<Article, String> _f$slug = Field(
    'slug',
    _$slug,
    opt: true,
  );
  static String? _$content(Article v) => v.content;
  static const Field<Article, String> _f$content = Field(
    'content',
    _$content,
    opt: true,
  );
  static String? _$coverImage(Article v) => v.coverImage;
  static const Field<Article, String> _f$coverImage = Field(
    'coverImage',
    _$coverImage,
    key: r'cover_image',
    opt: true,
  );
  static String? _$status(Article v) => v.status;
  static const Field<Article, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static int? _$readTimeMinutes(Article v) => v.readTimeMinutes;
  static const Field<Article, int> _f$readTimeMinutes = Field(
    'readTimeMinutes',
    _$readTimeMinutes,
    key: r'read_time_minutes',
    opt: true,
  );
  static int? _$viewsCount(Article v) => v.viewsCount;
  static const Field<Article, int> _f$viewsCount = Field(
    'viewsCount',
    _$viewsCount,
    key: r'views_count',
    opt: true,
  );
  static DateTime? _$publishedAt(Article v) => v.publishedAt;
  static const Field<Article, DateTime> _f$publishedAt = Field(
    'publishedAt',
    _$publishedAt,
    key: r'published_at',
    opt: true,
  );
  static DateTime? _$createdAt(Article v) => v.createdAt;
  static const Field<Article, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static DateTime? _$updatedAt(Article v) => v.updatedAt;
  static const Field<Article, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );

  @override
  final MappableFields<Article> fields = const {
    #id: _f$id,
    #title: _f$title,
    #slug: _f$slug,
    #content: _f$content,
    #coverImage: _f$coverImage,
    #status: _f$status,
    #readTimeMinutes: _f$readTimeMinutes,
    #viewsCount: _f$viewsCount,
    #publishedAt: _f$publishedAt,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static Article _instantiate(DecodingData data) {
    return Article(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      slug: data.dec(_f$slug),
      content: data.dec(_f$content),
      coverImage: data.dec(_f$coverImage),
      status: data.dec(_f$status),
      readTimeMinutes: data.dec(_f$readTimeMinutes),
      viewsCount: data.dec(_f$viewsCount),
      publishedAt: data.dec(_f$publishedAt),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Article fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Article>(map);
  }

  static Article fromJson(String json) {
    return ensureInitialized().decodeJson<Article>(json);
  }
}

mixin ArticleMappable {
  String toJson() {
    return ArticleMapper.ensureInitialized().encodeJson<Article>(
      this as Article,
    );
  }

  Map<String, dynamic> toMap() {
    return ArticleMapper.ensureInitialized().encodeMap<Article>(
      this as Article,
    );
  }

  ArticleCopyWith<Article, Article, Article> get copyWith =>
      _ArticleCopyWithImpl<Article, Article>(
        this as Article,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ArticleMapper.ensureInitialized().stringifyValue(this as Article);
  }

  @override
  bool operator ==(Object other) {
    return ArticleMapper.ensureInitialized().equalsValue(
      this as Article,
      other,
    );
  }

  @override
  int get hashCode {
    return ArticleMapper.ensureInitialized().hashValue(this as Article);
  }
}

extension ArticleValueCopy<$R, $Out> on ObjectCopyWith<$R, Article, $Out> {
  ArticleCopyWith<$R, Article, $Out> get $asArticle =>
      $base.as((v, t, t2) => _ArticleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArticleCopyWith<$R, $In extends Article, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? title,
    String? slug,
    String? content,
    String? coverImage,
    String? status,
    int? readTimeMinutes,
    int? viewsCount,
    DateTime? publishedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  ArticleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArticleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Article, $Out>
    implements ArticleCopyWith<$R, Article, $Out> {
  _ArticleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Article> $mapper =
      ArticleMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? title = $none,
    Object? slug = $none,
    Object? content = $none,
    Object? coverImage = $none,
    Object? status = $none,
    Object? readTimeMinutes = $none,
    Object? viewsCount = $none,
    Object? publishedAt = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != $none) #title: title,
      if (slug != $none) #slug: slug,
      if (content != $none) #content: content,
      if (coverImage != $none) #coverImage: coverImage,
      if (status != $none) #status: status,
      if (readTimeMinutes != $none) #readTimeMinutes: readTimeMinutes,
      if (viewsCount != $none) #viewsCount: viewsCount,
      if (publishedAt != $none) #publishedAt: publishedAt,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  Article $make(CopyWithData data) => Article(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    slug: data.get(#slug, or: $value.slug),
    content: data.get(#content, or: $value.content),
    coverImage: data.get(#coverImage, or: $value.coverImage),
    status: data.get(#status, or: $value.status),
    readTimeMinutes: data.get(#readTimeMinutes, or: $value.readTimeMinutes),
    viewsCount: data.get(#viewsCount, or: $value.viewsCount),
    publishedAt: data.get(#publishedAt, or: $value.publishedAt),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  ArticleCopyWith<$R2, Article, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ArticleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SavedArticleMapper extends ClassMapperBase<SavedArticle> {
  SavedArticleMapper._();

  static SavedArticleMapper? _instance;
  static SavedArticleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SavedArticleMapper._());
      ArticleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SavedArticle';

  static String _$id(SavedArticle v) => v.id;
  static const Field<SavedArticle, String> _f$id = Field('id', _$id);
  static DateTime? _$createdAt(SavedArticle v) => v.createdAt;
  static const Field<SavedArticle, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$userId(SavedArticle v) => v.userId;
  static const Field<SavedArticle, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );
  static String? _$articleId(SavedArticle v) => v.articleId;
  static const Field<SavedArticle, String> _f$articleId = Field(
    'articleId',
    _$articleId,
    key: r'article_id',
    opt: true,
  );
  static Article? _$article(SavedArticle v) => v.article;
  static const Field<SavedArticle, Article> _f$article = Field(
    'article',
    _$article,
    opt: true,
  );

  @override
  final MappableFields<SavedArticle> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #userId: _f$userId,
    #articleId: _f$articleId,
    #article: _f$article,
  };

  static SavedArticle _instantiate(DecodingData data) {
    return SavedArticle(
      id: data.dec(_f$id),
      createdAt: data.dec(_f$createdAt),
      userId: data.dec(_f$userId),
      articleId: data.dec(_f$articleId),
      article: data.dec(_f$article),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SavedArticle fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SavedArticle>(map);
  }

  static SavedArticle fromJson(String json) {
    return ensureInitialized().decodeJson<SavedArticle>(json);
  }
}

mixin SavedArticleMappable {
  String toJson() {
    return SavedArticleMapper.ensureInitialized().encodeJson<SavedArticle>(
      this as SavedArticle,
    );
  }

  Map<String, dynamic> toMap() {
    return SavedArticleMapper.ensureInitialized().encodeMap<SavedArticle>(
      this as SavedArticle,
    );
  }

  SavedArticleCopyWith<SavedArticle, SavedArticle, SavedArticle> get copyWith =>
      _SavedArticleCopyWithImpl<SavedArticle, SavedArticle>(
        this as SavedArticle,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SavedArticleMapper.ensureInitialized().stringifyValue(
      this as SavedArticle,
    );
  }

  @override
  bool operator ==(Object other) {
    return SavedArticleMapper.ensureInitialized().equalsValue(
      this as SavedArticle,
      other,
    );
  }

  @override
  int get hashCode {
    return SavedArticleMapper.ensureInitialized().hashValue(
      this as SavedArticle,
    );
  }
}

extension SavedArticleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SavedArticle, $Out> {
  SavedArticleCopyWith<$R, SavedArticle, $Out> get $asSavedArticle =>
      $base.as((v, t, t2) => _SavedArticleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SavedArticleCopyWith<$R, $In extends SavedArticle, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ArticleCopyWith<$R, Article, Article>? get article;
  $R call({
    String? id,
    DateTime? createdAt,
    String? userId,
    String? articleId,
    Article? article,
  });
  SavedArticleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SavedArticleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SavedArticle, $Out>
    implements SavedArticleCopyWith<$R, SavedArticle, $Out> {
  _SavedArticleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SavedArticle> $mapper =
      SavedArticleMapper.ensureInitialized();
  @override
  ArticleCopyWith<$R, Article, Article>? get article =>
      $value.article?.copyWith.$chain((v) => call(article: v));
  @override
  $R call({
    String? id,
    Object? createdAt = $none,
    Object? userId = $none,
    Object? articleId = $none,
    Object? article = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (createdAt != $none) #createdAt: createdAt,
      if (userId != $none) #userId: userId,
      if (articleId != $none) #articleId: articleId,
      if (article != $none) #article: article,
    }),
  );
  @override
  SavedArticle $make(CopyWithData data) => SavedArticle(
    id: data.get(#id, or: $value.id),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    userId: data.get(#userId, or: $value.userId),
    articleId: data.get(#articleId, or: $value.articleId),
    article: data.get(#article, or: $value.article),
  );

  @override
  SavedArticleCopyWith<$R2, SavedArticle, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SavedArticleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

