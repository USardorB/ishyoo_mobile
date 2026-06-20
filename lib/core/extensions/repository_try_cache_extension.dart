import 'package:fpdart/fpdart.dart';
import 'package:mobile/core/shared/failures.dart';

extension RepositoryTryCacheExtension<T> on Future<T> {
  Future<Either<Failure, R>> asEither<R>({
    R Function(T r)? mapper,
  }) async {
    try {
      final result = await this;

      if (mapper != null) return right(mapper(result));

      if (R == Unit) return right(unit as R);

      return right(result as R);
    } catch (e, stackTrace) {
      return left(UnknownFailure(message: '$e', stackTrace: stackTrace));
    }
  }
}
