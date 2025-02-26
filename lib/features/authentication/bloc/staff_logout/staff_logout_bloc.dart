import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/auth_repository.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/staff_logout/staff_logout_event.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/staff_logout/staff_logout_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';

class StaffLogoutBloc extends Bloc<StaffLogoutEvent, StaffLogoutState> {
  final AuthRepository authRepository;

  StaffLogoutBloc(this.authRepository) : super(StaffLogoutInitial()) {
    on<StaffLogout>((event, emit) async {
      emit(StaffLogoutLoading());
      try {
        final res = await authRepository.staffLogout();
        emit(StaffLogoutLoaded(message: res.toString()));
      } on DioException catch(e) {
        emit(StaffLogoutError(e: DioExceptionHandler.handleException(e)));
      }
    });
  }
}