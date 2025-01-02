import 'package:blog_application/utils/api_service/http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImpl implements HttpService{
 final String _baseUrl = "http://10.0.2.2:9090/api/post";

 final String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJTYWtpYiIsImlhdCI6MTczNTgxMDY4NSwiZXhwIjoxNzM1ODI4Njg1fQ.PRMZukrTZuQK6A4PXv-9vKu3ULInbd3OxIffKJvHCgfKQvIcUfVcT1TUII5Hx4N0wG3T1e62D90vUu-5caq9Aw";

  @override
  Future<http.Response> getPost() async {
    Uri uri = Uri.parse("$_baseUrl/all?pageNumber=1&pageSize=6");
    
    final headers = {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    };

    return http.get(uri, headers: headers);
  }

  @override
  Future<void> post(Map<String, dynamic> post) async {
    Uri uri = Uri.parse("");
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<void> put(Map<String, dynamic> post, int id) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}