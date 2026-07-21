import 'package:dio/dio.dart';
import 'package:mobile/core/shared/models/base_result.dart';
import 'package:mobile/features/location/data/models/region.dart';
import 'package:mobile/features/location/data/models/district.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'location_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class LocationRemoteDataSource {
  @factoryMethod
  factory LocationRemoteDataSource(Dio dio) = _LocationRemoteDataSource;

  @GET('/regions')
  Future<BaseResult<List<Region>>> getRegions();

  @GET('/regions/{id}/districts')
  Future<BaseResult<List<District>>> getDistricts(@Path('id') String regionId);
}
