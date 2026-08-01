import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/app.dart';
import 'package:mobile/core/consts/api_endpoints.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/services/token_service.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final TokenService _tokenService;
  Dio? dio;

  bool _isRefreshing = false;
  final _queuedRequests =
      <({RequestOptions options, ErrorInterceptorHandler handler})>[];

  AuthInterceptor(this._tokenService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokenService.getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final path = response.requestOptions.path;

    // Save token on register/login
    if ((path.contains('/register') || path.contains('/login')) &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final data = response.data;
      if (data is Map<String, dynamic> && data['data'] != null) {
        final token = data['data']['access_token'] as String?;
        final did = data['data']['did'] as String?;
        if (token != null) {
          final role = path.contains('/candidate') ? 'candidate' : 'employer';
          _tokenService.saveAccessToken(token);
          if (did != null) {
            _tokenService.saveDid(did, role: role);
          }
        }
      }
    }

    // Clear token on logout
    if (path.contains('/logout') && response.statusCode == 200) {
      _tokenService.clearTokens();
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (!_isRefreshing) {
        _isRefreshing = true;
        _queuedRequests.add((options: err.requestOptions, handler: handler));

        try {
          final role = _tokenService.getRole() ?? 'candidate';
          final did = _tokenService.getDid();

          final refreshDio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
          if (did != null) {
            refreshDio.options.headers['x-did'] = did;
          }

          final response = await refreshDio.get('/auth/$role/refresh-token');

          if (response.statusCode == 200) {
            final data = response.data;
            if (data is Map<String, dynamic> && data['data'] != null) {
              final newToken = data['data']['access_token'] as String?;
              if (newToken != null) {
                _tokenService.saveAccessToken(newToken);

                for (final request in _queuedRequests) {
                  final options = request.options;
                  options.headers['Authorization'] = 'Bearer $newToken';

                  try {
                    final retryResponse = await dio!.fetch(options);
                    request.handler.resolve(retryResponse);
                  } on DioException catch (e) {
                    request.handler.next(e);
                  }
                }

                _queuedRequests.clear();
                _isRefreshing = false;
                return;
              }
            }
          }

          // If refresh failed (e.g. invalid response or missing token in response)
          _failAllAndLogout(err);
        } catch (e) {
          _failAllAndLogout(err);
        }
      } else {
        // Already refreshing, queue the request
        _queuedRequests.add((options: err.requestOptions, handler: handler));
      }
    } else {
      handler.next(err);
    }
  }

  void _failAllAndLogout(DioException err) {
    _tokenService.clearTokens();
    for (final request in _queuedRequests) {
      request.handler.next(err);
    }
    _queuedRequests.clear();
    _isRefreshing = false;

    appRouter.replaceAll([
      const OnboardingRoute(),
      LoginRoute(role: .job_seeker),
    ]);
  }
}
