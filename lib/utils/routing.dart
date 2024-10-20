import '/screen/home.dart';
import '/screen/splash.dart';
import '/screen/posts/posts.dart';
import 'package:flutter/material.dart';
import '../screen/posts/post_detail.dart';
import '/data/models/blog_post_model.dart';

class Routing {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case Splash.route:
        return _pageRouter(page: const Splash());

      case Home.route:
        return _pageRouter(page: const Home());

      case BlogPosts.route:
        return _pageRouter(
          page: BlogPosts(
            blogId: settings.arguments as String,
          ),
        );

      case PostDetail.route:
        return _pageRouter(
          page: PostDetail(
            post: settings.arguments as BlogPostModel,
          ),
        );

      default:

        ///Error 404 -> Route not found
        return null;
    }
  }

  static PageRoute _pageRouter({required Widget page}) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
