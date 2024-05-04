// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_architecture_learning/feature/test/data/data_sources/remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clean_architecture_learning/main.dart';

void main()async {
  final UserRemoteDataSourceImpl userRemoteDataSourceImpl = UserRemoteDataSourceImpl();
  var response = await userRemoteDataSourceImpl.getUser(2);
  print(response);
}
