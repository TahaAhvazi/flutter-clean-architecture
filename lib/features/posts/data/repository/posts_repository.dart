import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/features/posts/data/data_source/remote/get_posts_api.dart';
import 'package:flutter_json_clean/features/posts/domain/entities/posts.dart';
import 'package:flutter_json_clean/features/posts/domain/repository/posts_repository.dart';
import 'package:http/http.dart';

class PostsRepositoryImp implements PostsRepository {
  final PostApiService _postApiService;

  PostsRepositoryImp({required PostApiService postApiService})
      : _postApiService = postApiService;
  @override
  Future<DataState<List<PostsEntities>>> getPosts() async {
    try {
      final result = await _postApiService.fetchPosts();
      print("RESUUUUUUUUUUUUUULT :$result");
      if (result.isNotEmpty) {
        return DataSuccess(result);
      }
      return DataFailed(ClientException("IDFK :)"));
    } on ClientException catch (e) {
      return DataFailed(e);
    }
  }
}
