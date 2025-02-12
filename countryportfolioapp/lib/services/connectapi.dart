import 'package:dio/dio.dart';

const String token = '2094|XhUhwEZBtDJNSgLnYW0ylX9wAFCv3DolLUGn7pCQ';

class ApiService {
  // ignore: unused_field
  static final Dio _dio = Dio(
    BaseOptions(
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    ),
  );
  Dio get dio => _dio;
}

// Future<dynamic> getPost(int postId) async {
//     try {
//       Response response = await _dio.get('/posts/$postId');
//       return response.data; // Returns the API response
//     } catch (e) {
//       throw Exception("Failed to load post: $e");
//     }
//   }