import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/features/posts/domain/entities/posts.dart';

abstract class PostsRepository {
  Future<DataState<List<PostsEntities>>> getPosts();
}
