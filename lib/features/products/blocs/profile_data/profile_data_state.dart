import 'package:foodtastic_four_admin/features/authentication/models/user_register_model.dart';

abstract class ProfileDataState {}

class ProfileDataInitial extends ProfileDataState {}

class ProfileDataLoading extends ProfileDataState {}

class ProfileDataLoaded extends ProfileDataState {
  final UserRegisterModel userRegisterModel;

  ProfileDataLoaded({required this.userRegisterModel});
}

class ProfileDataError extends ProfileDataState {
  final String error;

  ProfileDataError({required this.error});
}