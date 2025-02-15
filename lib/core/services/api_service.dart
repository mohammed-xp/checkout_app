import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post({
    required String url,
    required body,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    Map<String, String> apiRequestHeaders = {'Authorization': 'Bearer $token'};
    if (headers != null) apiRequestHeaders.addEntries(headers.entries);
    var response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: apiRequestHeaders,
      ),
    );

    return response;
  }
}
