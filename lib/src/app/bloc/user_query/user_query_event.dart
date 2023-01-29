part of 'user_query_bloc.dart';

@immutable
abstract class CustomerQueryEvent {}

class UserQueryGet extends CustomerQueryEvent {

  UserQueryGet({
    this.id,
    this.name,
    this.role,
    this.phone,
  });
  final String? id;
  final String? name;
  final String? role;
  final String? phone;
}
