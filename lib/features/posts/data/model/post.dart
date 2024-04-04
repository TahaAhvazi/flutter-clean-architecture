import 'package:flutter_json_clean/features/posts/domain/entities/posts.dart';

class PostsModel extends PostsEntities {
  const PostsModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });
  factory PostsModel.fromJson(Map<String, dynamic> map) {
    return PostsModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
