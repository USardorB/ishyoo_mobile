import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/features/location/data/datasources/location_remote_data_source.dart';
import 'package:mobile/features/location/data/models/district.dart';
import 'package:mobile/features/location/data/models/region.dart';
import 'package:mobile/features/location/domain/repositories/location_repository.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Region>>> getRegions() async {
    try {
      final result = await remoteDataSource.getRegions();
      if (result.success && result.data != null) {
        return Right(result.data!);
      }
      return Left(
        ServerFailure(message: "location.errors.occurred".tr()),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          message: e.response?.data['message'] ?? e.message ?? "location.errors.occurred".tr(),
        ),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<District>>> getDistricts(String regionId) async {
    try {
      final result = await remoteDataSource.getDistricts(regionId);
      if (result.success && result.data != null) {
        return Right(result.data!);
      }
      return Left(
        ServerFailure(message: "location.errors.occurred".tr()),
      );
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          message: e.response?.data['message'] ?? e.message ?? "location.errors.occurred".tr(),
        ),
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
