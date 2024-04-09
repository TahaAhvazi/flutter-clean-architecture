import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json_clean/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter_json_clean/features/users/presentation/pages/userpages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostLoadingFailedState) {
            return const Center(
              child: Text("ERRRRROR"),
            );
          }
          if (state is PostsLoadedSuccessfulState) {
            return ListView.builder(
              itemCount: state.posts!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const UsersPage(),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      state.posts![index].title,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("ERRRRROR"),
          );
        },
      ),
    );
  }
}
