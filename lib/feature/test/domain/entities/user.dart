import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String fullName;
  final String profileImage;

  @override
  List<Object> get props => [id, email, fullName, profileImage];

  const User(
      {required this.id, required this.email, required this.fullName, required this.profileImage});

}