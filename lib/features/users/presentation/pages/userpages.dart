import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_json_clean/features/users/data/data_source/remote/get_users_api.dart';
import 'package:flutter_json_clean/features/users/data/repository/user_repository.dart';
import 'package:flutter_json_clean/features/users/domain/usecase/usecase.dart';
import 'package:flutter_json_clean/features/users/presentation/blocs/users/users_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UsersBloc(
          GetUsersUseCase(
            usersRepository: UserRepositoryImp(
              usersApiService: UsersApiService(),
            ),
          ),
        )..add(OnUsersGetEvent()),
        child: BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedFailedState) {
              return const Center(
                child: Text("FUCKING ERRRRROR"),
              );
            }
            if (state is UsersLoadedSuccessfullState) {
              return ListView.builder(
                itemCount: state.users!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.users![index].name,
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text("We have Fucking Error"),
            );
          },
        ),
      ),
    );
  }
}
