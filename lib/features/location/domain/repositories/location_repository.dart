import 'package:fpdart/fpdart.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/features/location/data/models/region.dart';
import 'package:mobile/features/location/data/models/district.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Region>>> getRegions();
  Future<Either<Failure, List<District>>> getDistricts(String regionId);
}
