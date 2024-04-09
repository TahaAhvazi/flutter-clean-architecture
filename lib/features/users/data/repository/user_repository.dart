import 'package:flutter_json_clean/core/resources/data_state.dart';
import 'package:flutter_json_clean/features/users/data/data_source/remote/get_users_api.dart';
import 'package:flutter_json_clean/features/users/domain/entities/users.dart';
import 'package:flutter_json_clean/features/users/domain/repository/users_repository.dart';
import 'package:http/http.dart';

class UserRepositoryImp implements UsersRepository {
  final UsersApiService _usersApiService;

  UserRepositoryImp({required UsersApiService usersApiService})
      : _usersApiService = usersApiService;

  @override
  Future<DataState<List<UsersEntities>>> getUsers() async {
    try {
      final result = await _usersApiService.fetchUsers();
      if (result.isNotEmpty) {
        return DataSuccess(result);
      } else {
        return DataFailed(
          ClientException(
            "IDFK :)",
          ),
        );
      }
    } on ClientException catch (fuckingException) {
      return DataFailed(fuckingException);
    }
  }
}
