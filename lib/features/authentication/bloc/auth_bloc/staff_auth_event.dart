abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final int employeeId;
  final int counterId;
  final String fullName;
  final String email;
  final String password;

  RegisterEvent({required this.employeeId, required this.counterId, required this.fullName, required this.email, required this.password});
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class CheckAuthEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}