part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final List<UserEntity>? user;
  final DioException? error;

  const UserState({this.user, this.error});

  @override
  List<Object?> get props => [user, error];
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final List<UserEntity> listUser;

  const UserLoaded(this.listUser);
}

class UserError extends UserState {
  final DioException error;

  const UserError(this.error);
}
