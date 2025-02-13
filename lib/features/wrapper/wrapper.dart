import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/common/widgets/custom_btn_tab.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_event.dart';
import 'package:foodtastic_four_admin/features/navigation/controller/navigation_bloc.dart';
import 'package:foodtastic_four_admin/routes/router.dart';
import 'package:foodtastic_four_admin/utils/theme/theme/theme.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationBloc()..add(StartNavigationTimer())),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => ButtonBloc()),
      ],
      child: MaterialApp.router(
        title: 'Campus Craves',
        theme: FAppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.instance.router,
      ),
    );
  }
}
