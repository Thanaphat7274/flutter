import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchApp extends StatefulWidget {
  const SearchApp({super.key});

  @override
  State<SearchApp> createState() => _SearchAppState();
}

class Post {
  final int id;
  final String title;
  final String body;
  Post({required this.id, required this.title, required this.body});
  factory Post.fromjson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}

class _SearchAppState extends State<SearchApp> {
  List<Post> posts = [];
  List<Post> filteredPosts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<List<Post>> fetchPosts() async {
    try {
      var response = await http.get(Uri.parse('https://dummyjson.com/posts'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> posts = data['posts'];

        filteredPosts = posts.map((json) => Post.fromjson(json)).toList();
        return filteredPosts;
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Search App"),
        backgroundColor: Colors.blue,
      ),
      // body: FutureBuilder<List<Post>>(
      //   future: fetchPosts(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       List<Post> filteredPosts = snapshot.data!;
      //       return ListView.builder(
      //        itemCount: filteredPosts.length,
      //        separatorBuilder: (context, index) {
      //           return const Divider(color: Colors.grey);
      //         },
      //       );
      //     }
      //     return const Center(child: Text('no data'));
      //   },
      // ),
    );
  }
}
