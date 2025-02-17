import 'package:dio/dio.dart';
import 'package:untitled2/models/user_model.dart';

class ApiService2 {
  String baseUrl = "https://dummyjson.com";
  final Dio _dio = Dio();

  // GET Request
  Future<Response?> getRequest(String endpoint, String accessToken,
      {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.get(
        baseUrl + endpoint,
        queryParameters: queryParams,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
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
