import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_state.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FDeviceUtility.setStatusBarColor(FAppColor.fWhite, Brightness.dark);
    return Scaffold(
      backgroundColor: FAppColor.fWhite,
      body: BlocListener<NavigationBloc, NavigationState>(
        listener: (context, state) {
          if(state is NavigateState) {
            context.go('/onboard');
          }
        },
          child: Center(child: SizedBox(height: 280, width: 280, child: Image.asset(FAppImg.logoJpg, fit: BoxFit.contain, filterQuality: FilterQuality.high,)))),
    );
  }
}
