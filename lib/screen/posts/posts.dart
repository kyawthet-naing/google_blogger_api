import '/data/api/blogga_api_v3.dart';
import '/data/models/blog_post_model.dart';
import '/screen/posts/post_detail.dart';
import 'package:flutter/material.dart';

class BlogPosts extends StatefulWidget {
  static const String route = "/posts";
  final String blogId;
  const BlogPosts({super.key, required this.blogId});

  @override
  State<BlogPosts> createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  bool isLoading = true;
  List<BlogPostModel> posts = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getPost();
    });
    super.initState();
  }

  _getPost() async {
    List<BlogPostModel> posts = await BloggaApiV3.getPosts(widget.blogId);
    setState(() {
      isLoading = false;
      this.posts = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (ctx, idx) {
                return ListTile(
                  title: Text(posts[idx].title ?? ""),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PostDetail.route,
                      arguments: posts[idx],
                    );
                  },
                );
              },
            ),
    );
  }
}
