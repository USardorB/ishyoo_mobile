import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/core/shared/models/base_result.dart';

extension RepositoryExtension<T> on Future<BaseResult<T>> {
  /// Maps a `Future<BaseResult<T>>` from Retrofit to an `Either<Failure, R>`
  /// Handles HTTP errors and parsing errors via DioException.
  ///
  /// The [mapper] function allows you to modify the model (e.g. copyWith)
  /// or extract specific data before it is returned.
  Future<Either<Failure, R>> asEither<R>({R Function(T data)? mapper}) async {
    try {
      final response = await this;

      if (mapper != null) {
        return Right(mapper(response.data as T));
      }

      if (R == Unit) {
        return Right(unit as R);
      }

      return Right(response.data as R);
    } on DioException catch (e, stackTrace) {
      String errorMessage = e.message ?? 'Unknown network error occurred';
      if (e.response?.data is Map<String, dynamic>) {
        errorMessage = e.response?.data['message']?.toString() ?? errorMessage;
      }

      return Left(
        ServerFailure(
          message: errorMessage,
          stackTrace: stackTrace,
        ),
      );
    } catch (e, stackTrace) {
      return Left(
        UnknownFailure(
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
