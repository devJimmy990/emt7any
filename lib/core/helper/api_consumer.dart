import 'package:dio/dio.dart';
import 'package:emt7any/core/helper/secure_storage.dart';
import 'package:emt7any/core/helper/service_locator.dart';

class ApiResponse<T> {
  ApiResponse({required this.status, required this.msg, this.data});

  factory ApiResponse.success(T? data, {String msg = "Success"}) =>
      ApiResponse(status: true, msg: msg, data: data);

  factory ApiResponse.error(String msg) => ApiResponse(status: false, msg: msg);
  final bool status;
  final String msg;
  final T? data;

  @override
  String toString() => 'ApiResponse(status: $status, msg: $msg, data: $data)';
}

class ApiConsumer {
  ApiConsumer(String baseUrl, String? token)
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final storedToken = await sl<SecureStorage>().readString("token");
          if (storedToken != null && storedToken.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $storedToken";
          } else {
            options.headers.remove("Authorization");
          }
          return handler.next(options);
        },
      ),
    );
  }

  final Dio _dio;

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );
      if ((response.data["status"] as bool) == false) {
        return ApiResponse.error(response.data["message"]);
      }
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      if ((response.data["status"] as bool) == false) {
        return ApiResponse.error(response.data["message"]);
      }
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      if ((response.data["status"] as bool) == false) {
        return ApiResponse.error(response.data["message"]);
      }
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      );
      if ((response.data["status"] as bool) == false) {
        return ApiResponse.error(response.data["message"]);
      }
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

  ApiResponse<T> _handleError<T>(DioException e) {
    String message = "Unknown error occurred";

    if (e.response != null) {
      message =
          e.response?.data?['message']?.toString() ??
          e.response?.statusMessage ??
          "Request failed";
    } else {
      if (e.type == DioExceptionType.connectionTimeout) {
        message = "Connection timeout";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        message = "Receive timeout";
      } else if (e.type == DioExceptionType.badResponse) {
        message = "Bad response from server";
      } else {
        message = e.message ?? "Unexpected error";
      }
    }

    return ApiResponse.error(message);
  }
}
