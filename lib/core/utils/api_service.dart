import 'package:dio/dio.dart';

class ApiService {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://hoorus.online/api/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
    dynamic query,
    dynamic data,
    String? token,
  }) async {
    Options options = Options(
      headers: {'Authorization': 'Bearer $token'},
    );
    return await dio.get(url,
        queryParameters: query, data: data, options: options);
  }

  static Future<Response> postData({
    required String url,
    dynamic data,
    dynamic query,
    String? token,
  }) async {
    Options options = Options(
      headers: {
        'Accept': 'Application/json',
      },
    );
    //dio.options.headers = {'Accept': 'application/json'};
    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> putData({
    required String url,
    dynamic data,
    dynamic query,
    String? token,
  }) async {
    Options options = Options(
      headers: {'Authorization': 'Bearer $token'},
    );
    return await dio.put(url,
        data: data, queryParameters: query, options: options);
  }

  static Future<Response> deleteData({
    required String url,
    dynamic query,
    String? token,
  }) async {
    Options options = Options(
      headers: {'Authorization': 'Bearer $token'},
    );
    return await dio.delete(url, queryParameters: query, options: options);
  }
}
