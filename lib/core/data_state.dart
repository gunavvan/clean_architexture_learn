import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? message;

  DataState({this.data, this.message});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  DataError(DioException message) : super(message: message);
}