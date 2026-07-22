import 'package:dart_mappable/dart_mappable.dart';

part 'base_result.mapper.dart';

@MappableClass()
class Pagination with PaginationMappable {
  final int total;

  const Pagination({
    this.total = 0,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      PaginationMapper.fromMap(json);
}

@MappableClass()
class BaseResult<T> with BaseResultMappable<T> {
  final bool success;
  final String? message;
  final T? data;
  final Pagination? pagination;

  const BaseResult({
    required this.success,
    this.message,
    this.data,
    this.pagination,
  });

  /// Custom factory that works perfectly with Retrofit + dart_mappable
  /// Retrofit will pass the function to deserialize [T] as [fromJsonT].
  factory BaseResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseResult<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String?,
      data: _parseDataWithMetadata(json, fromJsonT),
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }

  static T? _parseDataWithMetadata<T>(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    if (json['data'] != null) {
      final data = json['data'];
      if (data is Map<String, dynamic> && json['metadata'] != null) {
        // Inject metadata into data map so models can access it
        data['metadata'] = json['metadata'];
      }
      return fromJsonT(data);
    } else if (json['metadata'] != null) {
      return fromJsonT(json['metadata']);
    }
    return null;
  }
}
