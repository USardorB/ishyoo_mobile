import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/consts/api_endpoints.dart';
import 'package:mobile/core/shared/models/base_result.dart';
import 'package:mobile/features/auth/data/models/auth_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST(ApiEndpoints.smsRequest)
  Future<BaseResult<SmsRequestResponse>> requestSms(
    @Path("role") String role,
    @Body() Map<String, dynamic> payload,
  );

  @POST(ApiEndpoints.verify)
  Future<BaseResult<VerifyMetadataResponse>> verify(
    @Path("role") String role,
    @Body() Map<String, dynamic> request,
  );

  @POST(ApiEndpoints.register)
  Future<BaseResult<AuthTokensResponse>> register(
    @Path("role") String role,
    @Body() Map<String, dynamic> request,
  );

  @POST(ApiEndpoints.login)
  Future<BaseResult<AuthTokensResponse>> login(
    @Path("role") String role,
    @Body() Map<String, dynamic> request,
  );

  @GET(ApiEndpoints.getMe)
  Future<BaseResult<UserMeResponse>> getMe(
    @Path("role") String role,
  );

  @GET(ApiEndpoints.refreshToken)
  Future<BaseResult<RefreshTokenResponse>> refreshToken(
    @Path("role") String role,
  );

  @POST(ApiEndpoints.logout)
  Future<BaseResult<void>> logout(
    @Path("role") String role,
  );
}
