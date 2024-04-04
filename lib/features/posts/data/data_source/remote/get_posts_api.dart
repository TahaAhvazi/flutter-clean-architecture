import 'dart:convert';

import 'package:flutter_json_clean/core/constant.dart';
import 'package:flutter_json_clean/features/posts/data/model/post.dart';
import 'package:http/http.dart' as http;

class PostApiService {
  Future<List<PostsModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => PostsModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load the posts!");
    }
  }
}
