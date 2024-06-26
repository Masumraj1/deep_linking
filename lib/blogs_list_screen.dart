


import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'models/blog_model.dart';
class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {


  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }

  ///===============================fetch all blogs method========================
  List<Blog> blogs = [];
  Future<void> fetchBlogs() async {
    final response = await http
        .get(Uri.parse('https://dev.to/api/articles?username=djsmk123'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      setState(() {
        blogs = data.map((item) => Blog.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to fetch blogs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///==================================Blog List Appbar====================
      appBar: AppBar(
        title: const Text('Blog List'),centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, '/blog/${blogs[index].id.toString()}');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///===================================image======================
                    CachedNetworkImage(
                      imageUrl: blogs[index].coverImage ?? "",
                          // "https://res.cloudinary.com/practicaldev/image/fetch/s--jHFtjt-q--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/i/6ldycmfgo0z9raslz79k.png",
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///=============================Title====================
                          Text(
                            blogs[index].title,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          ///========================================Description===================
                          Text(
                            blogs[index].description ?? "",
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
