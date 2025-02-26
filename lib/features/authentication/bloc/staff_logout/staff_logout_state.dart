abstract class StaffLogoutState {}

class StaffLogoutInitial extends StaffLogoutState {}

class StaffLogoutLoading extends StaffLogoutState {}

class StaffLogoutLoaded extends StaffLogoutState {
  final String message;

  StaffLogoutLoaded({required this.message});
}

class StaffLogoutError extends StaffLogoutState {
  final String e;

  StaffLogoutError({required this.e});
}