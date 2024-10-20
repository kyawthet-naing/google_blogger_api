import '/data/models/blog_post_model.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  final BlogPostModel post;
  static const String route = "/post-detail";
  const PostDetail({super.key, required this.post});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title ?? ""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: Text(widget.post.content ?? "")),
    );
  }
}
