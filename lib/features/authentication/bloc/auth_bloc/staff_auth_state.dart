abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String token;

  Authenticated({required this.token});
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});
}