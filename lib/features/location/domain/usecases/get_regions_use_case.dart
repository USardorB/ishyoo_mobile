import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/core/shared/usecase.dart';
import 'package:mobile/features/location/data/models/region.dart';
import 'package:mobile/features/location/domain/repositories/location_repository.dart';

@lazySingleton
class GetRegionsUseCase implements UseCase<List<Region>, NoParam> {
  final LocationRepository repository;

  GetRegionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Region>>> call([NoParam? params]) {
    return repository.getRegions();
  }
}
