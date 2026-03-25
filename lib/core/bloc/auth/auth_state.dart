import 'package:movies/core/models/user_model.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final UserModel? user;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.user,
  });

  AuthState copyWith({
    AuthStatus? status,
    UserModel? user,
    bool clearUser = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: clearUser ? null : (user ?? this.user),
    );
  }
}
