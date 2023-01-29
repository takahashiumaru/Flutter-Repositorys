part of 'users_query_bloc.dart';

@immutable
abstract class UserQueryEvent {}

class UserQueryGet extends UserQueryEvent {
  UserQueryGet({
    this.id,
    this.nip,
    this.name,
    this.role,
    this.joinDate,
    this.email,
    this.phone,
  });
  final int? id;
  final String? nip;
  final String? name;
  final String? role;
  final String? joinDate;
  final String? email;
  final String? phone;
}
