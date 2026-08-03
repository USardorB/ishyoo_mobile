import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/core/shared/usecase.dart';
import 'package:mobile/features/location/data/models/district.dart';
import 'package:mobile/features/location/domain/repositories/location_repository.dart';

@lazySingleton
class GetDistrictsUseCase implements UseCase<List<District>, String> {
  final LocationRepository repository;

  GetDistrictsUseCase(this.repository);

  @override
  Future<Either<Failure, List<District>>> call([String? params]) {
    assert(params != null, "Region ID must be provided");
    return repository.getDistricts(params!);
  }
}
