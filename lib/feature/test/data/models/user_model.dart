// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:clean_architecture_learning/feature/test/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class DataUser extends User {
  String firstName;
  String lastName;
  String avatar;

  DataUser({
    required super.id,
    required super.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  }) : super(fullName: '$firstName $lastName', profileImage: avatar);

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}
