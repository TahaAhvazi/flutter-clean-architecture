import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/features/users/domain/entities/users.dart';

abstract class UsersRepository {
  Future<DataState<List<UsersEntities>>> getUsers();
}
