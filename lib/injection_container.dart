import 'package:flutter_json_clean/features/posts/data/data_source/remote/get_posts_api.dart';
import 'package:flutter_json_clean/features/posts/data/repository/posts_repository.dart';
import 'package:flutter_json_clean/features/posts/domain/repository/posts_repository.dart';
import 'package:flutter_json_clean/features/posts/domain/usecase/usecase.dart';
import 'package:get_it/get_it.dart';

import 'features/posts/presentation/bloc/posts/posts_bloc.dart';

final di = GetIt.instance;

Future<void> initilizeDependencies() async {
  di.registerSingleton<PostApiService>(PostApiService());
  di.registerSingleton<PostsRepository>(
      PostsRepositoryImp(postApiService: di()));
  di.registerSingleton<GetPostsUseCase>(GetPostsUseCase(postsRepository: di()));
  di.registerFactory<PostsBloc>(() => PostsBloc(di()));
}
