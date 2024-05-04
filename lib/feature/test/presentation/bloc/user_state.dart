part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final List<User>? users;
  final DioException? dioException;

  const UserState({this.users, this.dioException});

  @override
  List<Object?> get props => [users, dioException];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> listUser;

  const UserLoaded(this.listUser);
}

class UserError extends UserState {
}

