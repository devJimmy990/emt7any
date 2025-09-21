import 'package:dio/dio.dart';

class ApiResponse<T> {
  ApiResponse({required this.status, required this.msg, this.data});

  factory ApiResponse.success(
    T? data, {
    int status = 200,
    String msg = "Success",
  }) => ApiResponse(status: status, msg: msg, data: data);

  factory ApiResponse.error(String msg, {int status = -1}) =>
      ApiResponse(status: status, msg: msg);
  final int status;
  final String msg;
  final T? data;
}

class ApiConsumer {
  ApiConsumer(String baseUrl)
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "Authorization": "Bearer ",
          },
        ),
      );
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
      return ApiResponse.success(
        response.data,
        status: response.statusCode ?? 200,
      );
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
      return ApiResponse.success(
        response.data,
        status: response.statusCode ?? 200,
      );
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
      return ApiResponse.success(
        response.data,
        status: response.statusCode ?? 200,
      );
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
      return ApiResponse.success(
        response.data,
        status: response.statusCode ?? 200,
      );
    } on DioException catch (e) {
      return _handleError<T>(e);
    }
  }

  ApiResponse<T> _handleError<T>(DioException e) {
    String message = "Unknown error occurred";
    int status = -1;

    if (e.response != null) {
      status = e.response?.statusCode ?? -1;
      message =
          e.response?.data?['msg']?.toString() ??
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

    return ApiResponse.error(message, status: status);
  }
}
