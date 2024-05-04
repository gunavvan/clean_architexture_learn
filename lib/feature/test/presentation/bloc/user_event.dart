part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserLoadEvent extends UserEvent {
  const UserLoadEvent();
}
