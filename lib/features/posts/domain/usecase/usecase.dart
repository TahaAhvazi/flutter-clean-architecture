import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/core/usecase/usecase.dart';
import 'package:flutter_json_clean/features/posts/domain/entities/posts.dart';
import 'package:flutter_json_clean/features/posts/domain/repository/posts_repository.dart';

class GetPostsUseCase implements UseCase<DataState<List<PostsEntities>>, void> {
  final PostsRepository _postsRepository;

  GetPostsUseCase({required PostsRepository postsRepository})
      : _postsRepository = postsRepository;
  @override
  Future<DataState<List<PostsEntities>>> call({void params}) {
    return _postsRepository.getPosts();
  }
}
