import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/common/widgets/custom_btn_tab.dart';
import 'package:foodtastic_four_admin/data/repository/auth_repository.dart';
import 'package:foodtastic_four_admin/data/repository/food_order_repository.dart';
import 'package:foodtastic_four_admin/data/repository/food_poduct_repository.dart';
import 'package:foodtastic_four_admin/data/services/api_service.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auth_bloc/staff_auth_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/auto_navigate_bloc/auto_navigate_event.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/staff_logout/staff_logout_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/dumb_food_data/dumb_food_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_delivered/food_deliver_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_remove/food_remove_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_data/load_data_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_order/load_order_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/profile_data/profile_data_bloc.dart';
import 'package:foodtastic_four_admin/routes/router.dart';
import 'package:foodtastic_four_admin/utils/theme/theme/theme.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiService = ApiService(dio);
    final foodData = FoodProductRepository(apiService);
    final authRepository = AuthRepository(apiService);
    final foodOrder = FoodOrderRepository(apiService);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => foodData),
        RepositoryProvider(create: (_) => authRepository),
        RepositoryProvider(create: (_) => foodOrder),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBloc()..add(StartNavigationTimer())),
          BlocProvider(create: (context) => ButtonBloc()),
          BlocProvider(create: (context) => AuthBloc(authRepository)),
          BlocProvider(create: (context) => DumbFoodBloc(context.read<FoodProductRepository>())),
          BlocProvider(create: (context) => ProfileDataBloc(context.read<AuthRepository>())),
          BlocProvider(create: (context) => AllFoodBloc(context.read<FoodProductRepository>())),
          BlocProvider(create: (context) => LoadOrderBloc(context.read<FoodOrderRepository>())),
          BlocProvider(create: (context) => FoodRemoveBloc(foodData)),
          BlocProvider(create: (context) => StaffLogoutBloc(authRepository)),
          BlocProvider(create: (context) => FoodDeliverBloc(foodOrder))
        ],
        child: MaterialApp.router(
          title: 'Campus Craves',
          theme: FAppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.instance.router,
        ),
      ),
    );
  }
}
