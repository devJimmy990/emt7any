import 'package:emt7any/feature/auth/model/user.dart';

class AuthState {
  const AuthState({this.error, this.loading, this.user});

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      AuthState(user: User.fromJson(json['user']));

  Map<String, dynamic> toJson() => {'user': user?.toJson()};

  AuthState copyWith({String? error, bool? loading, User? user}) =>
      AuthState(error: error, loading: loading, user: user);

  @override
  String toString() =>
      'AuthState(error: $error, loading: $loading, user: $user)';

  final String? error;
  final bool? loading;
  final User? user;
}
