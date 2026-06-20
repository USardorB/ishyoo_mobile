import 'package:flutter/foundation.dart';

@immutable
sealed class Failure {
  final String message;
  final StackTrace? stackTrace;

  const Failure({required this.message, this.stackTrace});
}

@immutable
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.stackTrace});
}

@immutable
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.stackTrace});
}

@immutable
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.stackTrace});
}

@immutable
class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.stackTrace});
}
