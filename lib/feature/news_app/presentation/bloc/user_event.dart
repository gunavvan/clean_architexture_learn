part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class GetUserEvent extends UserEvent {
  const GetUserEvent();
}
