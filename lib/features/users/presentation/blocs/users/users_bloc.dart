import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/features/users/domain/entities/users.dart';
import 'package:flutter_json_clean/features/users/domain/usecase/usecase.dart';
import 'package:http/http.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase _getUsersUseCase;
  UsersBloc(this._getUsersUseCase) : super(UsersLoadingState()) {
    on<OnUsersGetEvent>((event, emit) async {
      if (kDebugMode) {
        print("🔥$state🔥");
      }
      final datastate = await _getUsersUseCase();
      if (datastate is DataSuccess && datastate.data!.isNotEmpty) {
        emit(UsersLoadedSuccessfullState(datastate.data!));
        if (kDebugMode) {
          print("🔥$state🔥");
        }
      }
      if (datastate is DataFailed) {
        emit(UserLoadedFailedState(datastate.error!));
        if (kDebugMode) {
          print("🔥$state🔥");
        }
      }
    });
  }
}
