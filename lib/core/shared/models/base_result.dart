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
      data: json['data'] != null
          ? fromJsonT(json['data'])
          : json['metadata'] != null
          ? fromJsonT(json['metadata'])
          : null,
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
          : null,
    );
  }
}
