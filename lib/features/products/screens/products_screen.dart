import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/common/styles/bill_ui_repo.dart';
import 'package:foodtastic_four_admin/data/repository/food_order_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_order/load_order_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_order/load_order_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_order/load_order_state.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:shimmer/shimmer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
              decoration: BoxDecoration(color: FAppColor.fWhite, border: Border(bottom: BorderSide(width: 1.3, color: FAppColor.fGrey.withOpacity(0.5)))),
              child: AppBar(backgroundColor: FAppColor.fWhite, leadingWidth: 50,
                title: Text('Hurry up! Room gonna fill up', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500)),
              )
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: FAppSizes.sm),
        child: BlocProvider(
            create: (context) => LoadOrderBloc(context.read<FoodOrderRepository>())..add(LoadOrder()),
          child: BlocBuilder<LoadOrderBloc, LoadOrderState>(
              builder: (context, state) {
                if(state is LoadOrderLoaded) {
                  return ListView.builder(
                    itemCount: state.foodOrders.length,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) {
                      final data = state.foodOrders[i];
                        return BillUiRepo(orderToken: data.orderToken, orderId: data.id, foodName: data.foodName, foodType: data.foodType, quantity: data.quantity.toString(), price: data.foodPrice.toString(), userName: data.userName, email: data.email, foodId: data.foodId,);
                      }
                  );
                } else if(state is LoadOrderLoading) {
                  return const FoodOrderShimmer();
                } else if(state is LoadOrderError) {
                  return Center(child: Text(state.e, style: Theme.of(context).textTheme.labelMedium,));
                }
                return Center(child: Text('There is nothing to show! 🐟', style: Theme.of(context).textTheme.labelLarge,));
              }),
        ),
      ),
    );
  }
}


class FoodOrderShimmer extends StatelessWidget {
  const FoodOrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return Column(children: List.generate(3, growable: true, (i) => Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Shimmer.fromColors( baseColor: FAppColor.fGrey,
        highlightColor: FAppColor.fGrey,
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 2),
        child: Container(height: size.height * 0.22,
          width: size.width * 0.95, decoration: BoxDecoration(color: FAppColor.fWhite, borderRadius: BorderRadius.circular(15)),),
      ),
    )),);
  }
}
