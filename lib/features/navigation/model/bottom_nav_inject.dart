import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/features/navigation/controller/navigation_bloc.dart';
import 'package:foodtastic_four_admin/features/products/screens/pages.dart';
import 'package:get/get.dart';

class BottomNavModel extends GetxController {
  final List<Widget> pages = const [
    HomeScreen(),
    ProductsScreen(),
    ProfileScreen(),
  ];

  void onPageChanged(int page, BuildContext ctx) {
    BlocProvider.of<BottomNavCubit>(ctx).changeSelectedIndex(page);
  }
}