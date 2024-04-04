import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/features/posts/domain/entities/posts.dart';
import 'package:flutter_json_clean/features/posts/domain/usecase/usecase.dart';
import 'package:http/http.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase _getPostsUseCase;
  PostsBloc(this._getPostsUseCase) : super(PostsLoadingState()) {
    on<OnPostGetEvent>((event, emit) async {
      print("--------------------💙💙💙💙");
      final dataState = await _getPostsUseCase();
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(PostsLoadedSuccessfulState(dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(PostLoadingFailedState(dataState.error!));
      }
      print(state);
    });
  }
}
