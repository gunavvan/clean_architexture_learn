import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];

  const UserEntity({this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar});
}
