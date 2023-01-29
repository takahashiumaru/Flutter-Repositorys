part of 'user_query_bloc.dart';

@immutable
class UserQueryState {

  const UserQueryState({
    this.users = const [],
    this.status = BlocStatus.initial,
  });
  final List<model.User> users;
  final BlocStatus status;

  UserQueryState copyWith({
    List<model.User>? users,
    BlocStatus? status,
  }) {
    return UserQueryState(
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }

  UserQueryState unsetCustomerOverview({
    List<model.User>? users,
    BlocStatus? status,
  }) {
    return UserQueryState(
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }
}
