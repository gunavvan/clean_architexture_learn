// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:clean_architecture_learning/feature/news_app/domain/entities/user.dart';
import 'package:clean_architecture_learning/feature/test/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModels extends UserEntity {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModels({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) =>
      UserModels(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
