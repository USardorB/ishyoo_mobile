import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile/core/shared/failures.dart';

@immutable
abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call([P params]);
}

@immutable
final class NoParam {}
