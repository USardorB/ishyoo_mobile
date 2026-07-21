import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/configs/network/auth_interceptor.dart';
import 'package:mobile/core/consts/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
    authInterceptor.dio = dio;
    dio.interceptors.addAll([
      authInterceptor,
      PrettyDioLogger(
        requestBody: true,
        maxWidth: 90,
        logPrint: (object) {
          if (kDebugMode) log("$object", name: "Dio");
        },
      ),
    ]);
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
