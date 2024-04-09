part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  final List<UsersEntities>? users;
  final ClientException? error;
  const UsersState({this.users, this.error});

  @override
  List<Object> get props => [
        users ?? [],
        error ?? ClientException("Error"),
      ];
}

final class UsersLoadingState extends UsersState {}

final class UsersLoadedSuccessfullState extends UsersState {
  const UsersLoadedSuccessfullState(List<UsersEntities> users)
      : super(users: users);
}

final class UserLoadedFailedState extends UsersState {
  const UserLoadedFailedState(ClientException error) : super(error: error);
}
