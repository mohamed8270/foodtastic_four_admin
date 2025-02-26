import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/auth_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/profile_data/profile_data_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/profile_data/profile_data_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';
import 'package:foodtastic_four_admin/utils/logging/logging.dart';

class ProfileDataBloc extends Bloc<ProfileDataEvent, ProfileDataState> {
  final AuthRepository authRepository;

  ProfileDataBloc(this.authRepository) : super(ProfileDataInitial()) {
    on<ProfileData>((event, emit) async {
      emit(ProfileDataLoading());
      try {
        String? token = await LocalStorage.token();
        if(token != null) {
          final userProfileData = await authRepository.staffProfile('Bearer $token');
          AppLogger.debug('This is email ID: ${userProfileData.email}');
          emit(ProfileDataLoaded(userRegisterModel: userProfileData));
        } else {
          emit(ProfileDataError(error: "Can't load the profile data"));
        }
      } on DioException catch(e) {
          emit(ProfileDataError(error: DioExceptionHandler.handleException(e)));
      }
    });
  }
}