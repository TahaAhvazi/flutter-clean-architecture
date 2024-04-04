part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  final List<PostsEntities>? posts;
  final ClientException? error;

  const PostsState({this.posts, this.error});

  @override
  List<Object> get props => [
        posts!,
        error!,
      ];
}

final class PostsLoadingState extends PostsState {}

final class PostsLoadedSuccessfulState extends PostsState {
  const PostsLoadedSuccessfulState(List<PostsEntities> posts)
      : super(posts: posts);
}

final class PostLoadingFailedState extends PostsState {
  const PostLoadingFailedState(ClientException error) : super(error: error);
}
