import '/data/models/blog_post_model.dart';
import '/utils/global.dart';
import '/data/models/blog_model.dart';
import 'package:dio/dio.dart';

class BloggaApiV3 {
  static const String _baseURL = "https://www.googleapis.com/blogger/v3/";
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseURL,
      headers: {
        "Authorization": "Bearer ${Global.oAuthToken}",
      },
    ),
  );

  static Future<List<BlogModel>> getBlogs() async {
    var response = await _dio.get('/users/self/blogs');
    var raw = response.data['items'] as List<dynamic>?;
    return raw?.map((e) => BlogModel.fromJson(e)).toList() ?? [];
  }

  static Future<List<BlogPostModel>> getPosts(String blogId) async {
    var response = await _dio.get('/blogs/$blogId/posts');
    var raw = response.data['items'] as List<dynamic>?;
    return raw?.map((e) => BlogPostModel.fromJson(e)).toList() ?? [];
  }
}
