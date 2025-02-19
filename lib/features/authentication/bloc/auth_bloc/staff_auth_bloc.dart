import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/auth_repository.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auth_bloc/staff_auth_event.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auth_bloc/staff_auth_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        Map<String, dynamic> body = {'employeeId': event.employeeId, 'counterId': event.counterId, 'fullName': event.fullName, 'email': event.email, 'password': event.password};
        final token = await authRepository.staffRegister(body);
        if(token!.isNotEmpty) {
          await LocalStorage.storeToken(token);
          emit(Authenticated(token: token));
        } else {
          emit(AuthError(error: 'Failed to register the user'));
        }
      } on DioException catch(e) {
        emit(AuthError(error: DioExceptionHandler.handleException(e)));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        Map<String, dynamic> body = {'email': event.email, 'password': event.password};
        await authRepository.staffLogin(body);
      } on DioException catch(e) {
        emit(AuthError(error: DioExceptionHandler.handleException(e)));
      }
    });
  }
}