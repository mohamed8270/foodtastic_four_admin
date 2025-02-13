import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_event.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(InitialState()) {
    on<StartNavigationTimer>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3));
      emit(NavigateState());
    });
  }
}