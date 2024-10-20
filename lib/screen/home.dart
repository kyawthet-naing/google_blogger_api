import '/data/api/auth_api.dart';
import '/data/api/blogga_api_v3.dart';
import '/data/models/blog_model.dart' hide Posts;
import '/screen/posts/posts.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class Home extends StatefulWidget {
  static const String route = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List<BlogModel> blogs = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getBlog();
    });
    super.initState();
  }

  _getBlog() async {
    List<BlogModel> blogs = await BloggaApiV3.getBlogs();
    setState(() {
      isLoading = false;
      this.blogs = blogs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Blog"),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthApi.signOut();
              Restart.restartApp();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (ctx, idx) {
                return ListTile(
                  title: Text(blogs[idx].name ?? ""),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      BlogPosts.route,
                      arguments: blogs[idx].id,
                    );
                  },
                );
              },
            ),
    );
  }
}
