import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_learning/core/data_state.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_architecture_learning/feature/news_app/domain/entities/user.dart';

import '../../../test/presentation/bloc/user_bloc.dart';
import '../../domain/use_cases/user_usecase.dart';


part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;

  UserBloc(this.getUserUseCase) : super(const UserLoading()) {
    on<UserEvent>((event, emit)async {
      final dataState= await getUserUseCase();

      if(dataState is DataSuccess && dataState.data!.isNotEmpty){
        emit(UserLoaded(dataState.data!));
      }else if(dataState is DataError){
        emit(UserError(dataState.message!));
      }
    });
  }
}
