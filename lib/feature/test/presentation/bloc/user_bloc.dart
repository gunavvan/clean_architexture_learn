import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/use_cases/get_all_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUserUseCase _getAllUserUseCase;
  UserBloc(this._getAllUserUseCase) : super(UserLoading()) {
    // on<UserEvent>((event, emit) {
    //
    // });
    on<UserEvent> (onGetUser);
  }

  void onGetUser(UserEvent event, Emitter<UserState> emit) async {
    final data = await _getAllUserUseCase.execute(2);

    if(data.isRight()){
      emit(UserLoaded(data.getOrElse(() => [])));
    } else {
      emit(UserError());
    }
  }
}
