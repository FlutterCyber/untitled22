import 'package:dio/dio.dart';

class ApiService {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      // Change to your API base URL
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // GET Request
  Future<Response?> getRequest(String endpoint,
      {Map<String, dynamic>? queryParams}) async {
    try {
      Response response =
          await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } catch (e) {
      print('GET Request Error: $e');
      return null;
    }
  }

  // POST Request
  Future<Response?> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      print('POST Request Error: $e');
      return null;
    }
  }

  // PUT Request
  Future<Response?> putRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      Response response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      print('PUT Request Error: $e');
      return null;
    }
  }

  // DELETE Request
  Future<Response?> deleteRequest(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      return response;
    } catch (e) {
      print('DELETE Request Error: $e');
      return null;
    }
  }
}
