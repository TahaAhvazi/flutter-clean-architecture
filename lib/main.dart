import 'package:flutter/material.dart';
import 'package:flutter_json_clean/features/posts/data/data_source/remote/get_posts_api.dart';
import 'package:flutter_json_clean/features/posts/data/repository/posts_repository.dart';
import 'package:flutter_json_clean/features/posts/domain/usecase/usecase.dart';
import 'package:flutter_json_clean/features/posts/presentation/pages/home.dart';
import 'package:flutter_json_clean/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/posts/presentation/bloc/posts/posts_bloc.dart';

Future<void> main() async {
  await initilizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (context) => PostsBloc(GetPostsUseCase(
          postsRepository:
              PostsRepositoryImp(postApiService: PostApiService())))
        ..add(OnPostGetEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
