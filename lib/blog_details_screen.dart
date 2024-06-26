

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';

import 'models/blog_model.dart';
import 'package:http/http.dart'as http;

class BlogDetailsScreen extends StatefulWidget {
  final String id;

  const BlogDetailsScreen({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  Blog? blog;
  bool error = false;

  @override
  void initState() {
    super.initState();
    fetchBlog();
  }

  ///===============================fetch blog======================
  Future<void> fetchBlog() async {
    final response =
        await http.get(Uri.parse('https://dev.to/api/articles/${widget.id}'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        blog = Blog.fromJson(data);
      });
    } else {
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
        actions: [
          ///=========================share button=======================
          IconButton(
              onPressed: () {
                Share.share(
                    'check out my blog "https://blogs-deeplink-example.vercel.app/blog/${blog?.id}');
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: blog != null
          ? ListView(
              children: [
                ///================================image==========================
                Image.network(blog!.coverImage ?? ""),
                    // "https://res.cloudinary.com/practicaldev/image/fetch/s--jHFtjt-q--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/6ldycmfgo0z9raslz79k.png"),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog!.title,
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      // Html(data: blog!.bodyHtml),
                    ],
                  ),
                ),
              ],
            )
          : error
              ? const Center(
                  child: Text("Error occured"),
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
