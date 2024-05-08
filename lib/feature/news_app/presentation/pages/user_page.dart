import 'package:clean_architecture_learning/feature/news_app/presentation/bloc/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserError) {
            return const Text('Error');
          }
          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.listUser.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.listUser[index].email ?? ""),
                  subtitle: Text(state.listUser[index].email ?? ""),
                );
              },
            );
          }
          return const Text('No Data');
        },
      ),
    );
  }
}
