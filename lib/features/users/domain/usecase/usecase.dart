import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/core/usecase/usecase.dart';
import 'package:flutter_json_clean/features/users/domain/entities/users.dart';
import 'package:flutter_json_clean/features/users/domain/repository/users_repository.dart';

class GetUsersUseCase implements UseCase<DataState<List<UsersEntities>>, void> {
  final UsersRepository _usersRepository;

  GetUsersUseCase({required UsersRepository usersRepository})
      : _usersRepository = usersRepository;
  @override
  Future<DataState<List<UsersEntities>>> call({void params}) {
    return _usersRepository.getUsers();
  }
}
