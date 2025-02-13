import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_state.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FDeviceUtility.setStatusBarColor(FAppColor.fGreen, Brightness.light);
    return Scaffold(
      backgroundColor: FAppColor.fGreen,
      body: BlocListener<NavigationBloc, NavigationState>(
        listener: (context, state) {
          if(state is NavigateState) {
            context.go('/onboard');
          }
        },
          child: Center(child: SvgPicture.asset(FAppImg.logo, height: 200, width: 200, colorFilter: const ColorFilter.mode(FAppColor.fWhite, BlendMode.srcIn),),)),
    );
  }
}
